// Suggested code may be subject to a license. Learn more: ~LicenseLog:3780351255.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:953647703.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dio = Dio();
const baseUrl = 'https://api-dev.lujgroup.com/';

class Service {
  // ignore: non_constant_identifier_names
  Future<Response<dynamic>> login(
      String username, String password, BuildContext context) async {
    final response = await Dio().post(
      '${baseUrl}member/account/login',
      data: {
        'username': username,
        'password': password,
      },
      options: Options(headers: {
        'accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      }),
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', response.data['access_token']);
      // ignore: use_build_context_synchronously
      GoRouter.of(context).go('/home');
      print(response);
    }
    return response;
  }

  Future getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    final response = await Dio().get(
      '${baseUrl}member/profile',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future getMenu() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    final response = await Dio().get(
      '${baseUrl}member/menu',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
