import 'package:koreaseatemp/models/observer_model_dto.dart';
import 'package:koreaseatemp/models/temperature_model_dto.dart';

import 'enums.dart';

class TemperatureModel {
  final String staCode; // 관측소 코드
  final String staName; // 관측소 이름
  final double waterTemperature; // 수온
  final Layer observeLayer; // 1: 표층, 2: 중층, 3: 저층
  final Repair repairGbn; // 상태 1: 정상, 2: 점검
  final DateTime observeDate;

  TemperatureModel.fromDTO(TemperatureModelDTO dto)
      : staCode = dto.staCode,
        staName = dto.staName,
        waterTemperature = double.parse(dto.waterTemperature ?? "0"),
        observeLayer = Layer.init(dto.observeLayer),
        repairGbn = Repair.init(dto.repairGbn),
        observeDate = DateTime.parse("${dto.observeDate} ${dto.observeTime}");
}

// class TemperatureModel {
//   final String staCode; // 관측소 코드
//   final String staName; // 관측소 이름
//   final String? staDescription; // 관측소 설명
//   final String gruName; // 해역 이름
//   final String bldDate; // 설치 일자
//   final String? endDate; // 종료 일자
//   final ObservedLayerInfo? surfaceTemperatureInfo; // 표층 정보
//   final ObservedLayerInfo? middleTemperatureInfo; // 중층 정보
//   final ObservedLayerInfo? bottomTemperatureInfo; // 저층 정보

//   TemperatureModel(
//     this.staCode,
//     this.staName,
//     this.staDescription,
//     this.gruName,
//     this.bldDate,
//     this.endDate,
//     this.surfaceTemperatureInfo,
//     this.middleTemperatureInfo,
//     this.bottomTemperatureInfo,
//   );

//   TemperatureModel.fromJson(Map<String, dynamic> json)
//       : staCode = json["staCode"],
//         staName = json["staName"],
//         staDescription = json["staDescription"],
//         gruName = json["gruName"],
//         bldDate = json["bldDate"],
//         endDate = json["endDate"],
//         surfaceTemperatureInfo = json["surfaceTemperatureInfo"],
//         middleTemperatureInfo = json["middleTemperatureInfo"],
//         bottomTemperatureInfo = json["bottomTemperatureInfo"];
// }

// class ObservedLayerInfo {
//   final Layer observeLayer; // 1: 표층, 2: 중층, 3: 저층
//   final Repair repairGbn; // 상태 1: 정상, 2: 점검
//   final String? depth; // 수심
//   final Enabled enabled; // 측정여부
//   final String waterTemperature; // 수온
//   final DateTime? observeDate; // 관측 날짜

//   ObservedLayerInfo(
//     this.observeLayer,
//     this.repairGbn,
//     this.depth,
//     this.enabled,
//     this.waterTemperature,
//     this.observeDate,
//   );

//   ObservedLayerInfo.fromTemperatureDTO(TemperatureModelDTO temperatureDTO)
//       : observeLayer = Layer.init(temperatureDTO.observeLayer),
//         repairGbn = Repair.init(temperatureDTO.repairGbn),
//         depth = null,
//         enabled = Enabled.yes,
//         waterTemperature = temperatureDTO.waterTemperature ?? "-",
//         observeDate = DateTime.tryParse(temperatureDTO.observeDate);

//   // ObservedLayerInfo.fromJson(Map<String, dynamic> json)
//   //     : observeLayer = json["observeLayer"],
//   //       repairGbn = json["repairGbn"],
//   //       depth = json["depth"],
//   //       enabled = json["enabled"],
//   //       waterTemperature = json["waterTemperature"],
//   //       observeDate = json["observeDate"];
// }
