
import 'package:app_template/src/resources/repository/repository.dart';

import 'api_client.dart';
import 'dio.dart';

/// it is a hub that connecting pref,repo,client
/// used to reduce imports in pages
class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();



  factory ObjectFactory() => _objectFactory;

  ///Initialisation of Objects
  ApiClient _apiClient = ApiClient();
  AppDio _appDio = AppDio();
  Repository _repository = Repository();




  ///
  /// Getters of Objects
  ///
  ApiClient get apiClient => _apiClient;
  AppDio get appDio => _appDio;


  Repository get repository => _repository;




///
/// Setters of Objects
///

}
