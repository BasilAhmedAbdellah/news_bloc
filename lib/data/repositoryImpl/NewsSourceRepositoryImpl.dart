import 'package:injectable/injectable.dart';
import 'package:news_bloc/data/dataSourceContract/NewsSourceDataSource.dart';
import 'package:news_bloc/data/model/sourcesResponse/Source.dart';
import 'package:news_bloc/repositoryContract/NewsSourceRepository.dart';
@Injectable(as: NewsSourceRepository)
class NewsSourceRepositoryImpl extends NewsSourceRepository{
  NewsSourceDataSource onlineDataSource;
  @factoryMethod
  NewsSourceRepositoryImpl(this.onlineDataSource);// dependency

  @override
  Future<List<Source>?> getSources(String categoryId) {
    return onlineDataSource.getSources(categoryId);
  }

}