import 'package:news_bloc/data/model/newsResponse/news.dart';

abstract class NewsRepository{
  Future<List<News>?> getNews(String? sourceId);
}