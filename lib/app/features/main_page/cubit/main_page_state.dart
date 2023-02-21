part of 'main_page_cubit.dart';

class MainPageState {
  const MainPageState({
    this.currency,
    this.status = Status.initial,
    this.errorMessage,
  });

  final CurrencyModel? currency;
  final Status status;
  final String? errorMessage;
}
