import 'package:demo_app_v1_1/bloc/register/register_bloc.dart';
import 'package:demo_app_v1_1/bloc/register/register_state.dart';
import 'package:demo_app_v1_1/routes.dart';
import 'package:demo_app_v1_1/screens/home.dart';
import 'package:demo_app_v1_1/widgets/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        switch (state) {
          case RegLoadingState():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
            break;

          case RegSuccessState():
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;

          case RegFailureState():
            Navigator.pop(context);
            final error = state.error;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(error)));
            break;

          default:
            break;
        }
      },
      child: RegistrationForm(),
    );
  }
}
