
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news_home_model.dart';

import '../core/network_services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void>getNewsData()async{
    emit(HomeLoading());
    try {
      final response = await HomeServices().getHomeData();
      emit(HomeSuccess(response));
    }catch(e){
      emit(HomeFailure(e.toString()));
    }

  }
}
