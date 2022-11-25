import 'package:equatable/equatable.dart';

abstract class Success extends Equatable{
  @override
  List<Object> get props => [];
}

class ApiSuccess extends Success{
  final int code;
  final String message;
  final List errors;
  var data;
  final String? nextPage;
  final int pagesCount;
  Map<String, dynamic>? json;

  ApiSuccess({
    required this.code,
    required this.message,
    this.errors = const [],
    this.data,
    this.nextPage,
    this.pagesCount = 1,
    this.json,
  });

  factory ApiSuccess.fromJson({required int code, required Map<String, dynamic> json}) {

    List errors = [];
    if (json.containsKey('errors')) {
      errors = json['errors'];
    }

    var jsonData;
    if (json.containsKey('data')) jsonData = json['data'];

    String? nextPage;
    if (json.containsKey('next')) nextPage = json['next'].toString();

    int pagesCount = 1;
    if (json.containsKey('pages_count')) pagesCount = double.parse(json['pages_count'].toString()).toInt();

    return ApiSuccess(
      code: code,
      message: json['detail'] ?? '',
      errors: errors,
      data: jsonData,
      nextPage: nextPage,
      pagesCount: pagesCount,
      json: json,
    );
  }
}

