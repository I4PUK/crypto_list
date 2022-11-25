import 'package:crypto_list/core/error/failure.dart';
import 'package:crypto_list/core/use_cases/use_case.dart';
import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:crypto_list/domain/repositories/ticker_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllTickers extends UseCase<List<TickerEntity>, GetAllTickersParams> {
  final TickerRepository tickerRepository;

  GetAllTickers(this.tickerRepository);

  @override
  Future<Either<Failure, List<TickerEntity>>> call(GetAllTickersParams params) async {
    return await tickerRepository.getAllTickers();
  }
}

class GetAllTickersParams {}