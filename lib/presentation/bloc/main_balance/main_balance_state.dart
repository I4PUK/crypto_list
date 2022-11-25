import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:equatable/equatable.dart';

abstract class MainBalanceState extends Equatable{
  const MainBalanceState();

  @override
  List<Object?> get props => [];
}

class MainBalanceSuccess extends MainBalanceState{
  final TickerEntity ticker;

  const MainBalanceSuccess({required this.ticker});

  @override
  List<Object?> get props => [ticker.name];
}

class MainBalanceEmpty extends MainBalanceState{

  const MainBalanceEmpty();

  @override
  List<Object?> get props => [];
}

class MainBalanceLoading extends MainBalanceState{

  const MainBalanceLoading();

  @override
  List<Object?> get props => [];
}

class MainBalanceError extends MainBalanceState{
  final String message;

  const MainBalanceError({required this.message});

  @override
  List<Object?> get props => [message];
}