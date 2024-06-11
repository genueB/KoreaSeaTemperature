import 'dart:convert';

class ObserverModelDTO {
  final String staCode; // 관측소 코드
  final String staName; // 관측소 이름
  final String? staDescription; // 관측소 설명
  final String gruName; // 해역 이름
  final String bldDate; // 설치 일자
  final String? endDate; // 종료 일자
  final String? surDepth; // 표층 수심
  final String? midDepth; // 중층 수심
  final String? botDepth; // 저층 수심
  final String latitude; // 위도
  final String longitude; // 경도
  final String surEnabled; // 표층 측정여부 Y / N
  final String midEnabled; // 중층 측정여부 Y / N
  final String botEnabled; // 저층 측정여부 Y / N

  ObserverModelDTO(
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

  ObserverModelDTO.fromJson(Map<String, dynamic> json)
      : staCode = json['sta_cde'],
        staName = json['sta_nam_kor'],
        staDescription = json['sta_des'],
        gruName = json['gru_nam'],
        bldDate = json['bld_dat'],
        endDate = json['end_dat'],
        surDepth = json['sur_dep'],
        midDepth = json['mid_dep'],
        botDepth = json['bot_dep'],
        latitude = json['lat'],
        longitude = json['lon'],
        surEnabled = json['sur_tmp_yn'],
        midEnabled = json['mid_tmp_yn'],
        botEnabled = json['bot_tmp_yn'];
}
