import 'package:injectable/injectable.dart';
import 'package:news_bloc/data/api/ApiManager.dart';
import 'package:news_bloc/data/dataSourceContract/NewsSourceDataSource.dart';
import 'package:news_bloc/data/model/sourcesResponse/Source.dart';
@Injectable(as: NewsSourceDataSource)
class NewsSourceDataSourceImpl extends NewsSourceDataSource {
  ApiManager apiManager;
  @factoryMethod
  NewsSourceDataSourceImpl(this.apiManager);// constructor Injection

  @override
  Future<List<Source>?> getSources(String categoryId)async {
    var response = await apiManager.getSources(categoryId);
    return response.sources;
  }

}