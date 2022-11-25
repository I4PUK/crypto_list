import 'package:crypto_list/core/error/failure.dart';
import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:dartz/dartz.dart';

// contract for repository
abstract class PersonRepository{
  Future<Either<Failure,List<Map<String, double>>>> getAllTickers();
}