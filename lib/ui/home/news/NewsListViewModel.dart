import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/api/ApiManager.dart';
import 'package:news_bloc/model/newsResponse/news.dart';

class NewsListViewModel extends Cubit<NewsListState>{
  NewsListViewModel():super(LoadingState('Loading ...'));

 void  loadNews(String? sourceId)async{
    emit(LoadingState('Loading ...'));
    try{
      var response = await ApiManager.getNews(sourceId);
      if(response.status=='error'){
        emit(ErrorState(response.message??""));
      }
      else{
        emit(SuccessState(response.articles));
      }
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