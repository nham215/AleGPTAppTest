import 'package:dio/dio.dart';
import 'package:learn/configs/dio.dart';

class UserController {
  final Dio dio = DioHelper.defaultApiClient;

  Future<String> login(String email, String password) async {
    final res = await dio.post(
      "/login",
      data: {'email': email, 'password': password},
    );

    return res.data;
  }
}
