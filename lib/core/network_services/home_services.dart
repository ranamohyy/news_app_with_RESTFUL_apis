import 'dart:developer';
import 'package:news_app/core/constans.dart';
import 'package:news_app/core/network_services/dio_helper.dart';
import 'package:news_app/core/network_services/end_points.dart';
import 'package:news_app/models/news_home_model.dart';

class HomeServices {
  getHomeData() async {
    try {
      final response = await DioHelper.getData(EndPoints.homeEndPoint, query: {
        'country': 'us',
        'apiKey': AppConstans.apiKey,
      });
      if (response.statusCode == 200) {
        NewsHomeModel newsHomeModel = NewsHomeModel.fromJson(response.data);
        return newsHomeModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }

  getSearchData(String query) async {
    try {
      final response =
          await DioHelper.getData(EndPoints.searchEndPoint, query: {
        'q': query,
        'apiKey': AppConstans.apiKey,
      });
      if (response.statusCode == 200) {
        NewsHomeModel newsHomeModel = NewsHomeModel.fromJson(response.data);
        return newsHomeModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}
