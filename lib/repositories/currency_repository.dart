import 'package:crypto_wallet/data_sources/remote_data_source.dart';
import 'package:crypto_wallet/models/currency_model.dart';

class CurrencyRepository {
  CurrencyRepository(this._currencyDataSource);

  final CurrencyDataSource _currencyDataSource;

  Future<CurrencyModel?> getCurrencyData({
    required String currencyName,
  }) async {
    final json =
        await _currencyDataSource.getCurrencyData(currencyName: currencyName);

    if (json == null) return null;

    return CurrencyModel.fromJson(json);
  }
}
