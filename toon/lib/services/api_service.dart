import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toon/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = 'today';

  List<WebtoonModel> webtoonInstances = [];

  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');

    final response = await http.get(url);
    //Future :
    //미래에 들어올 값을 알려줌, 비동기 처리에 자주 나옴.
    //Future<Response> : response.body 에 응답 결과 반환
    //웹툰 데이터를 받기전에 다음 코드를 실행하면 안됨 --> await async 비동기 처리

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        var toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
        // print(toon.title);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
