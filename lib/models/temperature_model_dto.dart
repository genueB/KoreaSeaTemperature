class TemperatureModelDTO {
  final String staCode; // 관측소 코드
  final String staName; // 관측소 이름
  final String? waterTemperature; // 수온
  final String observeLayer; // 1: 표층, 2: 중층, 3: 저층
  final String repairGbn; // 상태 1: 정상, 2: 점검
  final String observeTime; // 관측시간
  final String observeDate; // 관측일자

  TemperatureModelDTO(
    this.staCode,
    this.staName,
    this.waterTemperature,
    this.observeLayer,
    this.repairGbn,
    this.observeTime,
    this.observeDate,
  );

  TemperatureModelDTO.fromJson(Map<String, dynamic> json)
      : staCode = json["sta_cde"],
        staName = json["sta_nam_kor"],
        waterTemperature = json["wtr_tmp"],
        observeLayer = json["obs_lay"],
        repairGbn = json["repair_gbn"],
        observeTime = json["obs_tim"],
        observeDate = json["obs_dat"];
}
