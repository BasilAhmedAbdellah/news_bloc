import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_bloc/data/model/newsResponse/NewsResponse.dart';
import 'package:news_bloc/data/model/sourcesResponse/SourcesResponse.dart';
@singleton
class ApiManager{
  static const baseUrl = 'newsapi.org';
  static const apiKey = 'f4f949f1fef6467ca03b05af4d492650';

 Future<SourcesResponse> getSources(String categoryId)async{
    //apiKey=API_KEY
    var uri = Uri.https(baseUrl,'v2/top-headlines/sources',
        {"apiKey":apiKey,
          "category": categoryId});
    var response = await http.get(uri);
    print(response.body);
    var json = jsonDecode(response.body);
    var sourcesResponse  = SourcesResponse.fromJson(json);
    return sourcesResponse;
//    response.body-> json -> objects

  }
 Future<NewsResponse> getNews(String? sourceId)async{
    var url = Uri.https(baseUrl,"v2/everything",{
      "apiKey":apiKey,
      "sources":sourceId
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}