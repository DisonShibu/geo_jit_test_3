
import 'dart:async';

import 'package:app_template/src/models/state.dart';
import 'package:app_template/src/models/user_details_response_model.dart';
import 'package:app_template/src/utils/object_factory.dart';

import 'base_bloc.dart';

/// api response of login is managed by AuthBloc
/// stream data is handled by StreamControllers

class UserBloc implements BaseBloc {
  StreamController<bool> _loading = new StreamController<bool>.broadcast();

  StreamController<List<UserInfoResponse>> _userInfo =
  new StreamController<List<UserInfoResponse>>.broadcast();


  // ignore: close_sinks

  // stream controller is broadcasting the  details

  /// stream for progress bar
  Stream<bool> get loadingListener => _loading.stream;

  Stream<List<UserInfoResponse>> get userInfoResponse =>
      _userInfo.stream;

  StreamSink<bool> get loadingSink => _loading.sink;

  userInfo()async{
    loadingSink.add(true);

    State state =
    await ObjectFactory().repository.userInfo();

    if (state is SuccessState) {
      loadingSink.add(false);
      _userInfo.sink.add(state.value);

    } else if (state is ErrorState) {
      loadingSink.add(false);
      _userInfo.sink.addError("Some error occured");
    }
  }

  ///disposing the stream if it is not using
  @override
  void dispose() {
    _userInfo.close();
  }
}


