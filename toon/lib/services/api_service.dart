import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toon/models/detail_model.dart';
import 'package:toon/models/episode_model.dart';
import 'package:toon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');

    final response = await http.get(url);
    //Future :
    //미래에 들어올 값을 알려줌, 비동기 처리에 자주 나옴.
    //Future<Response> : response.body 에 응답 결과 반환
    //웹툰 데이터를 받기전에 다음 코드를 실행하면 안됨 --> await async 비동기 처리

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
        // print(toon.title);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<DetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return DetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<EpisodeModel>> getEpisodesById(String id) async {
    List<EpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);

      for (var episode in episodes) {
        episodesInstances.add(EpisodeModel.fromJson(episode));
      }
      // print(episodesInstances);
      return episodesInstances;
    }
    throw Error();
  }
}
