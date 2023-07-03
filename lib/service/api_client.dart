import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  // Future<Response> registerUser() async {
  //   //IMPLEMENT USER REGISTRATION
  //   try {} on DioError catch (e) {
  //     return e.response!.data;
  //   }
  // }

  Future<Response> login(String username, String password) async {
    //IMPLEMENT USER LOGIN
    try {
      Response response = await _dio.post(
        'http://localhost/jualin_api/auth/login',
        data: {'username': username, 'password': password},
        // queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }

  Future<Response> getUserProfileData(String token) async {
    //GET USER PROFILE DATA
    try {
      Response response = await _dio.get(
        'http://localhost/jualin_api/auth/me',
        // queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }

  // Future<Response> logout() async {
  //   //IMPLEMENT USER LOGOUT
  // }
}
