
import 'package:app_template/src/models/state.dart';
import 'package:app_template/src/models/user_details_response_model.dart';
import 'package:app_template/src/utils/object_factory.dart';
import 'package:app_template/src/utils/urls.dart';

class UserApiProvider {

  Future<State> userInfoCall() async {
    final response = await ObjectFactory().apiClient.dio.get(Urls.baseUrl);
    print(response.toString());
    if (response.statusCode == 200) {
      List<dynamic> responseBody = response.data;
      List<UserInfoResponse> apiBodyList = responseBody
          .map(
            (dynamic item) => UserInfoResponse.fromJson(item),
      )
          .toList();
      return State<List<UserInfoResponse>>.success(apiBodyList);
    }
    else
      return null;
  }


}
