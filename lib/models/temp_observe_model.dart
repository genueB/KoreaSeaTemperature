import 'package:koreaseatemp/models/temperature_model.dart';

import 'enums.dart';
import 'observer_model.dart';

class TempObserveModel {
  // Observer
  final String staCode; // 관측소 코드
  final String staName; // 관측소 이름
  final String? staDescription; // 관측소 설명
  final String gruName; // 해역 이름
  final DateTime bldDate; // 설치 일자
  final DateTime? endDate; // 종료 일자
  final String latitude; // 위도
  final String longitude; // 경도

  // Temperature
  TemperatureModel? surfaceTemp;
  // final String? surDepth; // 표층 수심
  // final bool surEnabled; // 표층 측정여부
  // final double surWaterTemperature; // 표층 수온
  // final Repair surRepairGbn; // 표층 상태
  // final DateTime surObserveDate; // 표층 측정 시기

  TemperatureModel? middleTemp;
  // final String? midDepth; // 중층 수심
  // final bool midEnabled; // 중층 측정여부
  // final double midWaterTemperature; // 중층 수온
  // final Repair midRepairGbn; // 중층 상태
  // final DateTime midObserveDate; // 중층 측정 시기

  TemperatureModel? bottomTemp;
  // final String? botDepth; // 저층 수심
  // final bool botEnabled; // 저층 측정여부
  // final double botWaterTemperature; // 저층 수온
  // final Repair botRepairGbn; // 저층 상태
  // final DateTime botObserveDate; // 저층 측정 시기

  TempObserveModel({
    required this.staCode,
    required this.staName,
    required this.staDescription,
    required this.gruName,
    required this.bldDate,
    required this.endDate,
    required this.latitude,
    required this.longitude,
    // required this.surDepth,
    // required this.midDepth,
    // required this.botDepth,
    // required this.surEnabled,
    // required this.midEnabled,
    // required this.botEnabled,
    // required this.surWaterTemperature,
    // required this.midWaterTemperature,
    // required this.botWaterTemperature,
    // required this.surRepairGbn,
    // required this.midRepairGbn,
    // required this.botRepairGbn,
    // required this.surObserveDate,
    // required this.midObserveDate,
    // required this.botObserveDate,
  }); // 저층 측정 시기
}

class LayerInfo {
  final String? depth; // 수심
  final bool enabled; // 측정여부
  final double waterTemperature; // 수온
  final Repair repairGbn; // 상태
  final DateTime observeDate;

  LayerInfo({
    required this.depth,
    required this.enabled,
    required this.waterTemperature,
    required this.repairGbn,
    required this.observeDate,
  }); // 측정 시기
}
