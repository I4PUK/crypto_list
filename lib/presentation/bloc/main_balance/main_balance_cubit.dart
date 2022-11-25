import 'package:crypto_list/data/models/ticker.dart';
import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:crypto_list/domain/use_cases/update_main_balance.dart';
import 'package:crypto_list/presentation/bloc/main_balance/main_balance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBalanceCubit extends Cubit<MainBalanceState> {
  final UpdateMainBalance updateMainBalance;

  TickerEntity _mainTicker = TickerModel(name: 'USDT', value: 1);

  MainBalanceCubit({required this.updateMainBalance})
      : super(const MainBalanceEmpty());

  TickerEntity get mainTicker => _mainTicker;

  void setMainTicker(TickerEntity newTicker) {
    emit(const MainBalanceLoading());
    _mainTicker = newTicker;
    emit(MainBalanceSuccess(ticker: mainTicker));
  }

  void updateMainTickerBalance() async {
    emit(const MainBalanceLoading());
    final faulureOrResult =
        await updateMainBalance(UpdateMainBalanceParams(mainTicker));

    faulureOrResult.fold(
      (error) => emit(
        const MainBalanceError(message: 'Unable to update balance'),
      ),
      (value) => setMainTicker(value),
    );
  }
}
