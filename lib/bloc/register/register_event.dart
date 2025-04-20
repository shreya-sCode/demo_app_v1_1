import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegSubmitted extends RegisterEvent {
  final String emailValue;
  final String passwordValue;

  RegSubmitted({required this.emailValue, required this.passwordValue});

  @override
  List<Object?> get props => [emailValue, passwordValue];
}
