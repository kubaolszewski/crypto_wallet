import 'package:crypto_wallet/data_sources/remote_data_source.dart';
import 'package:crypto_wallet/models/currency_model.dart';

class CurrencyRepository {
  CurrencyRepository(this._currencyDataSource);

  final CurrencyDataSource _currencyDataSource;

  Future<CurrencyModel?> getCurrencyData({
    required String currencyName,
  }) async {
    final responseData =
        await _currencyDataSource.getCurrencyData(currencyName: currencyName);

    if (responseData == null) return null;

    final name = responseData['asset_id_base'] as String;
    final value = (responseData['rate'] + 0.0) as double;
    return CurrencyModel(name: name, value: value);
  }
}
