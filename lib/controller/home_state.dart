part of 'home_cubit.dart';

abstract class HomeState {}

 class HomeInitial extends HomeState {}
 class HomeLoading extends HomeState {}
 class HomeSuccess extends HomeState {
  final NewsHomeModel model;
  HomeSuccess(this.model);
 }
 class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);
 }
