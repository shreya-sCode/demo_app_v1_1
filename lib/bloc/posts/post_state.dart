import 'package:demo_app_v1_1/model/posts_model.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable{}

class PostInitialState extends PostState {
  @override
  List<Object?> get props => [];
}

class PostLoadingState extends PostState {
  @override
  List<Object?> get props => [];
}

class PostLoadedState extends PostState {
  final List<Posts> posts;
  PostLoadedState({required this.posts});
  @override
  List<Object?> get props => [posts];
}

class PostErrorState extends PostState {
  final String message;
  PostErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}