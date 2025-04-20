import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String confirmPassword;

  RegSubmitted({required this.email, required this.password, required this.confirmPassword});

  @override
  List<Object?> get props => [email, password, confirmPassword];
}
