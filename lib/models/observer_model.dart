import 'package:koreaseatemp/models/observer_model_dto.dart';

import 'enums.dart';

class ObserverModel {
  final String staCode; // 관측소 코드
  final String staName; // 관측소 이름
  final String? staDescription; // 관측소 설명
  final String gruName; // 해역 이름
  final DateTime bldDate; // 설치 일자
  final DateTime? endDate; // 종료 일자
  final String? surDepth; // 표층 수심
  final String? midDepth; // 중층 수심
  final String? botDepth; // 저층 수심
  final String latitude; // 위도
  final String longitude; // 경도
  final bool surEnabled; // 표층 측정여부
  final bool midEnabled; // 중층 측정여부
  final bool botEnabled; // 저층 측정여부

  ObserverModel(
    this.staCode,
    this.staName,
    this.staDescription,
    this.gruName,
    this.bldDate,
    this.endDate,
    this.surDepth,
    this.midDepth,
    this.botDepth,
    this.latitude,
    this.longitude,
    this.surEnabled,
    this.midEnabled,
    this.botEnabled,
  );

  ObserverModel.fromDTO(ObserverModelDTO dto)
      : staCode = dto.staCode,
        staName = dto.staName,
        staDescription = dto.staDescription,
        gruName = dto.gruName,
        bldDate = DateTime.parse(dto.bldDate),
        endDate = dto.endDate == null ? null : DateTime.tryParse(dto.endDate!),
        surDepth = dto.surDepth,
        midDepth = dto.midDepth,
        botDepth = dto.botDepth,
        latitude = dto.latitude,
        longitude = dto.longitude,
        surEnabled = dto.surEnabled == "Y" ? true : false,
        midEnabled = dto.midEnabled == "Y" ? true : false,
        botEnabled = dto.botEnabled == "Y" ? true : false;
}

// extension DateTimeExtension on DateTime {
//   DateTime? tryPareseNullable(String? formattedString) {
//     if (formattedString == null) {
//       return null;
//     }

//     return DateTime.tryParse(formattedString);
//   }
// }
