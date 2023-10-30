import 'package:news_bloc/data/model/newsResponse/news.dart';

abstract class NewsDataSource{
  Future<List<News>?> getNews(String? sourceId);

}