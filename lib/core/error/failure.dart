import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  @override
  List<Object> get props => [];
}

class ApiFailure extends Failure{
  final String? message;
  final int? statusCode;

  ApiFailure({this.message, this.statusCode});
}