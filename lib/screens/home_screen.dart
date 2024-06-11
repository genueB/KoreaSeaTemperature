import 'package:flutter/material.dart';
import 'package:koreaseatemp/models/enums.dart';
import 'package:koreaseatemp/models/observer_model.dart';
import 'package:koreaseatemp/models/temp_observe_model.dart';
import 'package:koreaseatemp/models/temperature_model.dart';
import 'package:koreaseatemp/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  var count = 0;

  List<TempObserveModel> tempObserverList = [];

  @override
  void initState() {
    super.initState();
    fetchInfo();
  }

  Future<void> fetchInfo() async {
    List<TemperatureModel> tempList = await ApiService.fetchTempInfo();
    List<ObserverModel> observerList = await ApiService.fetchObserverInfo();

    for (var observer in observerList) {
      final staCode = observer.staCode;

      final newInfo = TempObserveModel(
        staCode: observer.staCode,
        staName: observer.staName,
        staDescription: observer.staDescription,
        gruName: observer.gruName,
        bldDate: observer.bldDate,
        endDate: observer.endDate,
        latitude: observer.latitude,
        longitude: observer.longitude,
      );

      while (true) {
        final index = tempList.indexWhere((temp) => temp.staCode == staCode);

        print("");

        if (index == -1) {
          break;
        }

        final foundTemp = tempList.removeAt(index);

        if (foundTemp.observeLayer == Layer.surface) {
          newInfo.surfaceTemp = foundTemp;
        } else if (foundTemp.observeLayer == Layer.middle) {
          newInfo.middleTemp = foundTemp;
        } else if (foundTemp.observeLayer == Layer.bottom) {
          newInfo.bottomTemp = foundTemp;
        }
      }
      tempObserverList.add(newInfo);
    }

    // for (var observer in observerList) {
    //   final staCode = observer.staCode;
    //   final subTempList =
    //       tempList.where((temp) => temp.staCode == staCode).toList();

    //   print("subTempList $subTempList");
    // }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                selectWidget(),
                headerWidget(),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      setState(() {
                        isLoading = true;
                      });

                      return fetchInfo();
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (var info in tempObserverList)
                            TemperatureListItemWidget(
                              staName: info.staName,
                              surfaceTemp:
                                  info.surfaceTemp?.waterTemperature ?? -1,
                              middleTemp:
                                  info.middleTemp?.waterTemperature ?? -1,
                              bottomTemp:
                                  info.bottomTemp?.waterTemperature ?? -1,
                              onTap: () {},
                            )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (isLoading) const LoadingWidget()
        ],
      ),
    );
  }

  Widget selectWidget() {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(
            "전체",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return const Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "위치",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "표층",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "중층",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "저층",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }
}

class TemperatureListItemWidget extends StatelessWidget {
  final String staName;
  final double surfaceTemp;
  final double middleTemp;
  final double bottomTemp;
  final void Function()? onTap;

  const TemperatureListItemWidget({
    super.key,
    required this.staName,
    required this.surfaceTemp,
    required this.middleTemp,
    required this.bottomTemp,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
                    child: Text(
              staName,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ))),
            Expanded(
                child: Center(
              child: Text(
                surfaceTemp != -1 ? "$surfaceTemp℃" : "-",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            )),
            Expanded(
                child: Center(
                    child: Text(
              middleTemp != -1 ? "$middleTemp℃" : "-",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ))),
            Expanded(
                child: Center(
                    child: Text(
              bottomTemp != -1 ? "$bottomTemp℃" : "-",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ))),
          ],
        ),
      ),
    );
  }
}
