import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";

  final String today = 'today';

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');

    final response = await http.get(url);
    //Future :
    //미래에 들어올 값을 알려줌, 비동기 처리에 자주 나옴.
    //Future<Response> : response.body 에 응답 결과 반환
    //웹툰 데이터를 받기전에 다음 코드를 실행하면 안됨 --> await async 비동기 처리

    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
