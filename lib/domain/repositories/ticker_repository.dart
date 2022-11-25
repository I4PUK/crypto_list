import 'package:crypto_list/core/error/failure.dart';
import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:dartz/dartz.dart';

// contract for repository
abstract class TickerRepository{
  Future<Either<Failure,List<TickerEntity>>> getAllTickers();

  Future<Either<Failure, TickerEntity>> updateMainBalance(TickerEntity ticker);
}