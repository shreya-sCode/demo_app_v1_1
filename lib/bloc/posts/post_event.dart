import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable{}

class PostFetchEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}