import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/di/di.dart';
import 'package:news_bloc/ui/home/categories/Category.dart';
import 'package:news_bloc/ui/home/categoryDetails/CategoryDetailsViewModel.dart';
import 'package:news_bloc/ui/home/categoryDetails/SourcesTabsWidget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = getIt.get<CategoryDetailsViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel,
    CategoryDetailsState>(
        bloc: viewModel,
        builder: (context, state) {
          switch(state){
            case SuccessState():{
              var sourcesList = state.sourcesList;
                 return SourcesTabsWidget(sourcesList!);
            }
            case LoadingState():{
              return Center(child: Column(
                children: [
                  Text(state.message),
                  CircularProgressIndicator(),
                ],
              ));
            }
            case ErrorState():{
          return Center(
                  child: Column(
                    children: [
                      Text(state.errorMessage),
                      ElevatedButton(onPressed: () {
                        viewModel.loadSources(widget.category.id);
                      }, child: Text('Try Again'))
                    ],
                  ),
                );
            }
          }
        },);
    //call api
    // return FutureBuilder(
    //   future: ApiManager.getSources(category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError || snapshot.data?.status == 'error') {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data?.message ?? snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     var sourcesList = snapshot.data?.sources;
    //     return SourcesTabsWidget(sourcesList!);
    //   },
    // );
  }
}
