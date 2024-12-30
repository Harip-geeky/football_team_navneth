import 'base_url.dart';

abstract class Endpoints {
  static String baseUrl = BaseUrl.baseurl();
  static String teams = '$baseUrl/football/teams';
}
