import 'package:dio/dio.dart';

class CurrencyDataSource {
  Future<Map<String, dynamic>?> getCurrencyData({
    required String currencyName,
  }) async {
    final serverResponse = await Dio().get<Map<String, dynamic>>(
        'http://rest.coinapi.io/v1/exchangerate/$currencyName/USD?apikey=AC91C75A-6B9B-4E11-8F80-1F123E2B216E');
    return serverResponse.data;
  }
}
