class CurrencyModel {
  CurrencyModel({
    required this.name,
    required this.conversionCurrency,
    required this.value,
  });
  final String name;
  final String conversionCurrency;
  final double value;

  CurrencyModel.fromJson(Map<String, dynamic> json)
      : name = json['asset_id_base'],
        conversionCurrency = json['asset_id_quote'],
        value = json['rate'];

  Map<String, dynamic> toJson() => {
        'asset_id_base': name,
        'asset_id_quote': conversionCurrency,
        'rate': value,
      };
}
