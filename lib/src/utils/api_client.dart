import 'dart:io';

import 'package:app_template/src/models/header_model.dart';
import 'package:app_template/src/utils/urls.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';


enum AccessMode { READ, WRITE }
HeaderModel authHeaderModel = new HeaderModel();



class ApiClient {
  ApiClient(){
    initClient();
  }
  Dio dio;
  BaseOptions _baseOptions;


  initClient() async {
    _baseOptions = new BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 1000000,
        followRedirects: false,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true);

    dio = Dio(_baseOptions);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };

    dio.interceptors.add(CookieManager(new CookieJar()));
  }




}


