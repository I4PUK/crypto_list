import 'package:crypto_list/assets/json_files/json_dummy.dart';
import 'package:crypto_list/core/error/failure.dart';
import 'package:crypto_list/core/success/success.dart';

abstract class ApiDataSource {
  Future<ApiSuccess> get();
}

class ApiDataSourceImpl extends ApiDataSource {
  var response = () async {
    await Future.delayed(Duration(seconds: 2));
    return ApiResponse();
  };

  @override
  Future<ApiSuccess> get() async {
    return await _request(request: () => response());
  }

  static Future<ApiSuccess> _request({
    required Future<ApiResponse> Function() request,
  }) async {
    try {
      final response = await request();

      if (response.statusCode == 200) {
        return ApiSuccess(code: 200, message: "OK", data: response.data);
      } else {
        throw ApiFailure(
            message: response.statusMessage, statusCode: response.statusCode);
      }
    } catch (e) {
      throw ApiFailure(message: e.toString());
    }
  }
}
