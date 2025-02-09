import 'package:dio/dio.dart';
import 'dart:convert';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://food.56testing.club/Api/Api_customer';
  }

  Future<Response> getHomepageData() async {
    try {
      final response = await _dio.get(
        '/homepage_dynamic',
        options: Options(
          headers: {
            'Authorization': 'Basic ${base64Encode(utf8.encode('food123:food123'))}',
          },
        ),
        // **Include the request body here:**
        data: {
          "added_by_web": "food.56testing.club",
          "service_id": 2,
          "user_id": 1,
        },
      );
      // Debug Print Statement - IMPORTANT:
      print('API Response Data: ${response.data}');
      return response;
    } on DioException catch (e) {
      // Handle Dio errors (network issues, invalid credentials, etc.)
      throw _handleDioError(e);
    } catch (e) {
      // Handle other unexpected errors
      throw Exception('Unexpected error occurred: $e');
    }
  }

  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Request timed out. Please check your internet connection.');
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 401) {
          return Exception('Invalid API credentials.');
        }
        return Exception('Received invalid status code: ${error.response?.statusCode}');
      case DioExceptionType.cancel:
        return Exception('Request was cancelled.');
      case DioExceptionType.connectionError:
        return Exception('Connection error. Please check your internet connection.');
      case DioExceptionType.unknown:
      default:
        return Exception('An unexpected error occurred: ${error.message}');
    }
  }
}