import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  final _baseUrl = "http://10.0.2.2:3000/api/v1/";

  HttpService() {
    _dio = new Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );
  }

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwZGZmMzU2MDU1OGU4MmExMDRkNjc0OSIsImlhdCI6MTYyNzI3MTM4NSwiZXhwIjoxNjI5ODYzMzg1fQ.Ckdl3mr9_jMHQ7WugeQRTly0Lu1TwpxY9FQIzb4-as8";
  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, errorInterceptorHandler) => {
          print(error.message),
        },
        onRequest: (request, requestInterceptorHandler) =>
            {request.headers["Authorization"] = "Bearer " + token},
        onResponse: (response, responseInterceptorHandler) => {
          print(response.data),
        },
      ),
    );
  }

  Future<Response> getRequest(String endPoint) async {
    try {
      return await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.toString());
      throw Exception(e.message);
    }
  }
}
