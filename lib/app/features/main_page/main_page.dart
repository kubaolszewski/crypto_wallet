import 'package:crypto_wallet/app/features/main_page/cubit/main_page_cubit.dart';
import 'package:crypto_wallet/data_sources/remote_data_source.dart';
import 'package:crypto_wallet/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../repositories/currency_repository.dart';
import '../../core/enum/enums.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(
        CurrencyRepository(CurrencyDataSource()),
      ),
      child: BlocConsumer<MainPageCubit, MainPageState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage.toString();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final currencyModel = state.currency;
          return Center(
            child: Builder(builder: (context) {
              if (state.status == Status.loading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Loading, please wait...',
                        style: GoogleFonts.righteous(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const CircularProgressIndicator(
                        strokeWidth: 4.0,
                      ),
                    ],
                  ),
                );
              }

              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _SearchWidget(),
                    const SizedBox(height: 20),
                    if (currencyModel != null)
                      _CurrencyModel(currencyModel: currencyModel),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  _SearchWidget({
    Key? key,
  });

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Search, e.g. "BTC"',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainPageCubit>()
                        .getCurrencyData(currencyName: _controller.text);
                    _controller.clear();
                  },
                  child: Text(
                    'Search',
                    style: GoogleFonts.righteous(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CurrencyModel extends StatelessWidget {
  const _CurrencyModel({
    Key? key,
    required this.currencyModel,
  });

  final CurrencyModel currencyModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.red.shade300),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currencyModel.name,
                style: GoogleFonts.righteous(
                  color: Colors.white,
                  fontSize: 36,
                  letterSpacing: 3.0,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${currencyModel.conversionCurrency} : ${currencyModel.value.toStringAsFixed(2)}',
                style: GoogleFonts.righteous(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
