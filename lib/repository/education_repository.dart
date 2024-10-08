import 'dart:convert';

import 'package:active_matrimonial_flutter_app/app_config.dart';
import 'package:active_matrimonial_flutter_app/const/my_theme.dart';
import 'package:active_matrimonial_flutter_app/helpers/main_helpers.dart';
import 'package:active_matrimonial_flutter_app/main.dart';
import 'package:active_matrimonial_flutter_app/models_response/others/common_response.dart';
import 'package:active_matrimonial_flutter_app/redux/libs/helpers/show_message_state.dart';
import 'package:http/http.dart' as http;

import '../redux/libs/manage_profile/manage_profile_middleware/manage_profile_get_middlewares.dart';

class EducationRepository {
  /// post education status update

  Future<CommonResponse> postEducationStatus({id, required status}) async {
    var baseUrl = "${AppConfig.BASE_URL}/member/education-status/update";
    var accessToken = getToken;
    var postBody = jsonEncode({
      "status": status ? 1 : 0,
      "id": id,
    });

    var response = await http.post(Uri.parse(baseUrl),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: postBody);

    var responseBody = commonResponseFromJson(response.body);

    if (responseBody.result == true) {
      store.dispatch(educationGetMiddleware());

      store.dispatch(
          ShowMessageAction(msg: responseBody.message, color: MyTheme.success));
    } else {
      store.dispatch(
          ShowMessageAction(msg: responseBody.message, color: MyTheme.failure));
    }

    return responseBody;
  }
}
