import 'package:footbal_teams/domain/api/debug_status.dart';

abstract class BaseUrl {
  static String baseurl() {
    if (DebusStatus.IS_DEBUG) {
      return 'https://myfakeapi.com/api/';
    } else {
      return 'https://myfakeapi.com/api/';
    }
  }
}
