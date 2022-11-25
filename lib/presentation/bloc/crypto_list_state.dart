import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:equatable/equatable.dart';

abstract class CryptoListState extends Equatable{
  const CryptoListState();

  @override
  List<Object?> get props => [];
}

class CryptoListSuccess extends CryptoListState{
  final List<TickerEntity> tickersList;

  const CryptoListSuccess(this.tickersList);

  @override
  List<Object?> get props => [];
}

class CryptoListEmpty extends CryptoListState{

  const CryptoListEmpty();

  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState{

  const CryptoListLoading();

  @override
  List<Object?> get props => [];
}

class CryptoListError extends CryptoListState{
  final String message;

  const CryptoListError({required this.message});

  @override
  List<Object?> get props => [message];
}

class CryptoListUpdatedMain extends CryptoListState{
  final TickerEntity ticker;

  const CryptoListUpdatedMain({required this.ticker});

  @override
  List<Object?> get props => [ticker.name];
}