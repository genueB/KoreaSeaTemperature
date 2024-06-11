enum Enabled {
  yes,
  no;
}

enum Layer {
  none,
  surface,
  middle,
  bottom;

  static Layer init(String id) {
    if (id == '1') {
      return Layer.surface;
    } else if (id == '2') {
      return Layer.middle;
    } else if (id == '3') {
      return Layer.bottom;
    }

    return Layer.none;
  }

  // case none
  // case surface = "1"
  // case middle = "2"
  // case bottom = "3"

  // var toString: String {
  //     switch self {
  //     case .none:
  //         return "없음"
  //     case .surface:
  //         return "표층"
  //     case .middle:
  //         return "중층"
  //     case .bottom:
  //         return "저층"
  //     }
  // }
}

enum Repair {
  none,
  normal,
  repair;

  static Repair init(String id) {
    if (id == '1') {
      return Repair.normal;
    } else if (id == '2') {
      return Repair.repair;
    }

    return Repair.none;
  }

  // case none
  // case normal = "1"
  // case repair = "2"

  // var toString: String {
  //     switch self {
  //     case .normal:
  //         return "정상"
  //     case .repair:
  //         return "점검"
  //     case .none:
  //         return "없음"
  //     }
  // }
}
