import 'package:news_bloc/data/model/sourcesResponse/Source.dart';
abstract class NewsSourceRepository{
  Future<List<Source>?> getSources(String categoryId);
}