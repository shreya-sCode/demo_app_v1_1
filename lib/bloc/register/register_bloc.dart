import 'package:demo_app_v1_1/bloc/register/register_event.dart';
import 'package:demo_app_v1_1/bloc/register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegInitialState()) {
    on<RegSubmitted>((myEvent, sendState) async {
      sendState(RegLoadingState());

      try {
        //logic to register the user
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: myEvent.emailValue,
              password: myEvent.passwordValue,
            );

        //show success if successful
        sendState(RegSuccessState());

        //error handling logic
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'weak-password':
            sendState(RegFailureState(error: 'The provided password is weak'));
            break;

          case 'email-already-in-use':
            sendState(RegFailureState(error: 'This email is already in use'));
            break;

          case 'invalid-email':
            sendState(
              RegFailureState(
                error:
                    'The email address is not valid, Please enter a valid email address',
              ),
            );
            break;

          case 'operation-not-allowed':
            sendState(
              RegFailureState(error: 'Email/Password accounts are not enabled'),
            );
            break;

          case 'too-many-requests':
            sendState(
              RegFailureState(
                error: 'Too many requests, Please try again later',
              ),
            );
            break;

          default:
            sendState(RegFailureState(error: e.message ?? 'An error occured.'));
        }
      } catch (e) {
        //show error msg
      }
    });
  }
}
