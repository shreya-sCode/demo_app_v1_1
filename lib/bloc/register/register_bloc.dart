import 'package:demo_app_v1_1/bloc/register/register_event.dart';
import 'package:demo_app_v1_1/bloc/register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegInitialState()) {
    on<RegSubmitted>((myEvent, sendState) async {
      sendState(RegLoadingState());

      try {
        //logic to register the user
        //show success if successful
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)

        // else show error/ failure
      }catch (e) {
        //show error msg
      }
    });
  }
}
