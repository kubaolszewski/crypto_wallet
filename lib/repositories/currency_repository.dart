import 'package:crypto_wallet/models/currency_model.dart';
import 'package:dio/dio.dart';

class CurrencyRepository {
  Future<CurrencyModel>? getCurrencyInfo({
    required String currencyName,
  }) async {
    final serverResponse = await Dio().get(
        'http://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=AC91C75A-6B9B-4E11-8F80-1F123E2B216E');
    return CurrencyModel(name: 'Bitcoin', value: 25000.00);
  }

// http://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=AC91C75A-6B9B-4E11-8F80-1F123E2B216E
}
