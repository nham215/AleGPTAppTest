import 'package:dio/dio.dart';
import 'package:learn/configs/config.dart';

class DioHelper {
  static Dio get defaultApiClient => ApiClientBuilder()
      .ofUrl(Config.serviceUrl)
      // .addInterceptor(AuthInterceptors())
      .create();

  static Dio get weakNetWorkApiClient => ApiClientBuilder()
      .ofUrl(Config.serviceUrl)
      // .addInterceptor(AuthInterceptors())
      .setTimeout(const Duration(seconds: 6))
      .create();
  static Dio get weakNetWorkApiClient6s => ApiClientBuilder()
      .ofUrl(Config.serviceUrl)
      // .addInterceptor(AuthInterceptors())
      .setTimeout(const Duration(seconds: 6))
      .create();
  static Dio get weakNetWorkApiClient10s => ApiClientBuilder()
      .ofUrl(Config.serviceUrl)
      // .addInterceptor(AuthInterceptors())
      .setTimeout(const Duration(seconds: 10))
      .create();
}

class ApiClientBuilder {
  static const Duration defaultTimeout = Duration(seconds: 60);

  Dio dio = Dio(
    BaseOptions(
        connectTimeout: defaultTimeout,
        receiveTimeout: defaultTimeout,
        sendTimeout: defaultTimeout),
  );

  ApiClientBuilder addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
    return this;
  }

  ApiClientBuilder ofUrl(String url) {
    dio.options.baseUrl = url;
    return this;
  }

  ApiClientBuilder setTimeout(Duration timeout) {
    dio.options.connectTimeout = timeout;
    dio.options.sendTimeout = timeout;
    dio.options.receiveTimeout = timeout;
    return this;
  }

  Dio create() {
    return dio;
  }
}
