import 'package:news_bloc/data/model/sourcesResponse/Source.dart';

abstract class NewsSourceDataSource{
  Future<List<Source>?> getSources(String categoryId);
}