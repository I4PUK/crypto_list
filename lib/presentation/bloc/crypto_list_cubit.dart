import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:crypto_list/domain/use_cases/get_all_tickers.dart';
import 'package:crypto_list/presentation/bloc/crypto_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListCubit extends Cubit<CryptoListState> {
  final GetAllTickers getAllTickers;

  List<TickerEntity>? tickersList;

  CryptoListCubit({required this.getAllTickers})
      : super(const CryptoListEmpty());

  void loadTickerList() async {
    emit(const CryptoListLoading());

    final authResultOrError = await getAllTickers(GetAllTickersParams());
    authResultOrError.fold(
      (error) => emit(CryptoListError(message: error.toString())),
      (tickersList) {
        this.tickersList = tickersList;
        emit(CryptoListSuccess(this.tickersList ?? tickersList));
      },
    );
  }
}
