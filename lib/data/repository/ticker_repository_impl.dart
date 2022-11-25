import 'dart:math';

import 'package:crypto_list/core/error/failure.dart';
import 'package:crypto_list/core/success/success.dart';
import 'package:crypto_list/data/data_sources/api_data_source.dart';
import 'package:crypto_list/data/models/ticker.dart';
import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:crypto_list/domain/repositories/ticker_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class TickerRepositoryImpl extends TickerRepository {
  final ApiDataSource apiDataSource;

  TickerRepositoryImpl(this.apiDataSource);

  @override
  Future<Either<Failure, List<TickerEntity>>> getAllTickers() async {
    List<TickerEntity> responseList = [];
    final requestResponse = await _apiRequest(
      decodeFunction: (response) {
        var responseMap = response.data['rates'];

        responseMap.forEach(
          (k, v) => responseList.add(
            TickerModel(name: k, value: v),
          ),
        );

        return responseList;
      },
    );

    return requestResponse.fold(
      (error) => Left(error),
      (response) => Right(responseList),
    );
  }

  Future<Either<Failure, ApiSuccess>> _apiRequest({
    Function(ApiSuccess json)? decodeFunction,
  }) async {
    ApiSuccess apiResult;
    try {
      apiResult = await apiDataSource.get();
      if (decodeFunction != null) {
        apiResult.data = decodeFunction(apiResult);
      }
      return Right(apiResult);
    } on ApiFailure {
      return Left(ApiFailure());
    }
    catch (e){
      debugPrint(e.toString());
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TickerEntity>> updateMainBalance(TickerEntity ticker) async{
    double newRandomValue = Random().nextDouble();
    double roundedNewRandomValue = num.parse(newRandomValue.toStringAsFixed(2)).toDouble();

    final newTicker = TickerEntity(name: ticker.name, value: roundedNewRandomValue);

    Either<Failure, TickerEntity> response = Right(newTicker);

    await Future.delayed(const Duration(seconds: 1));

    return response;
  }
}
