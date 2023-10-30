import 'package:injectable/injectable.dart';
import 'package:news_bloc/data/dataSourceContract/NewsDataSource.dart';
import 'package:news_bloc/data/model/newsResponse/news.dart';
import 'package:news_bloc/repositoryContract/NewsRepositoryContract.dart';
@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository{
  NewsDataSource onlineDataSource;
  @factoryMethod
  NewsRepositoryImpl(this.onlineDataSource);

  @override
  Future<List<News>?> getNews(String? sourceId) {
    return onlineDataSource.getNews(sourceId);
  }
}