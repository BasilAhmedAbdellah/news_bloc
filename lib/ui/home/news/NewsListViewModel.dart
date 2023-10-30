import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_bloc/data/model/newsResponse/news.dart';
import 'package:news_bloc/repositoryContract/NewsRepositoryContract.dart';

@injectable
class NewsListViewModel extends Cubit<NewsListState>{
  late NewsRepository newsRepository;

  @factoryMethod
  NewsListViewModel(this.newsRepository):super(LoadingState('Loading ...'));

 void  loadNews(String? sourceId)async{
    emit(LoadingState('Loading ...'));
    try{
      var newsList = await newsRepository.getNews(sourceId);
      emit(SuccessState(newsList));
      // if(response.status=='error'){
      //   emit(ErrorState(response.message??""));
      // }
      // else{
      //   emit(SuccessState(response.articles));
      // }
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}
sealed class NewsListState{}
class SuccessState extends NewsListState{
  List<News>? newsList;
  SuccessState(this.newsList);
}
class LoadingState extends NewsListState{
  String loadingMessage;
  LoadingState(this.loadingMessage);
}
class ErrorState extends NewsListState{
  String errorMessage;
  ErrorState(this.errorMessage);
}