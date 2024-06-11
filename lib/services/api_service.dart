import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:koreaseatemp/models/observer_model.dart';
import 'package:koreaseatemp/models/observer_model_dto.dart';
import 'package:koreaseatemp/models/temperature_model.dart';
import 'package:koreaseatemp/models/temperature_model_dto.dart';

import 'package:cp949_codec/cp949_codec.dart';

class ApiService {
  // 옵저버의 상태 체크용
  // gru_nam (동해:E, 서해:W, 남해:S, 동중국해:EC)
  // use_yn (사용여부 T:사용중, F:사용안함)
  static const String observerBaseUrlStr =
      "https://www.nifs.go.kr/OpenAPI_json?id=risaCode&use_yn=Y&key="; // TempInfo2DTO

  /// 실시간어장 관측 정보
  /// 30분 단위
  ///  TemperatureApiResponseDTO을 관측소 코드를 기준으로 묶을 수 있음
  static const String temperatureBaseUrlStr =
      "https://www.nifs.go.kr/OpenAPI_json?id=risaList&key="; // TempInfoDTO

  static const String key = "qPwOeIrU-2401-VXVOVH-0724";

  // 국립수산과학원 - 관측 정보 api
  static Future<List<TemperatureModel>> fetchTempInfo() async {
    List<TemperatureModelDTO> temperatureDTOs = [];
    List<TemperatureModel> temperatures = [];

    final url = Uri.parse("$temperatureBaseUrlStr$key");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> temperatureResponses =
          jsonDecode(cp949.decodeString(response.body))["body"]["item"];

      for (var temperature in temperatureResponses) {
        final dto = TemperatureModelDTO.fromJson(temperature);
        temperatures.add(TemperatureModel.fromDTO(dto));
      }

      return temperatures;
    }

    throw Error();
  }

  // 국립수산과학원 - 관측소 정보 api
  static Future<List<ObserverModel>> fetchObserverInfo() async {
    List<ObserverModel> observers = [];
    final url = Uri.parse("$observerBaseUrlStr$key");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> observerResponses =
          jsonDecode(cp949.decodeString(response.body))["body"]["item"];

      print("observerResponses $observerResponses");

      for (var observer in observerResponses) {
        final dto = ObserverModelDTO.fromJson(observer);
        observers.add(ObserverModel.fromDTO(dto));
      }

      return observers;
    }

    throw Error();
  }
}
