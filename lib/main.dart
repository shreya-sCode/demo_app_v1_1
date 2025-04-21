import 'package:demo_app_v1_1/bloc/posts/post_bloc.dart';
import 'package:demo_app_v1_1/bloc/register/register_bloc.dart';
import 'package:demo_app_v1_1/routes.dart';
// import 'package:demo_app_v1_1/screens/home.dart';
// import 'package:demo_app_v1_1/screens/login.dart';
// import 'package:demo_app_v1_1/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        routes: AppRoutes.routes,
        // home: LoginScreen(),
      ),
    );
  }
}
