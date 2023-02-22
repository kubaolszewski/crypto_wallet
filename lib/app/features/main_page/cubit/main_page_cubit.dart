import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/models/currency_model.dart';

import '../../../../repositories/currency_repository.dart';
import '../../../core/enum/enums.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit(this._currencyRepository) : super(const MainPageState());

  final CurrencyRepository _currencyRepository;

  Future<void> getCurrencyData({
    required String currencyName,
  }) async {
    emit(
      const MainPageState(status: Status.loading),
    );
    try {
      final searchedCurrency = await _currencyRepository.getCurrencyData(
        currencyName: currencyName,
      );
      emit(
        MainPageState(
          currency: searchedCurrency,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        MainPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
