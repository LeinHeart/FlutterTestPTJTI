class CurrencyType {
  String ctId;
  String ctNama;
  String ctLogo;
  String ctKet;

  CurrencyType({
    required this.ctId,
    required this.ctNama,
    required this.ctLogo,
    required this.ctKet,
  });

  factory CurrencyType.fromJson(Map<String, dynamic> json) {
    return CurrencyType(
      ctId: json['ct_id'],
      ctNama: json['ct_nama'],
      ctLogo: json['ct_logo'],
      ctKet: json['ct_ket'],
    );
  }
  static List<CurrencyType> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((json) => CurrencyType.fromJson(json)).toList();
  }
}
