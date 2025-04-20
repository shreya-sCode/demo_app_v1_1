import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegInitialState extends RegisterState {
}

class RegLoadingState extends RegisterState {
}

class RegSuccessState extends RegisterState {
}

class RegFailureState extends RegisterState {
  final String error;
  RegFailureState({required this.error});

  @override
  List<Object?> get props => [error];
}
