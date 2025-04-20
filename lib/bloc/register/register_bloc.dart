import 'package:demo_app_v1_1/bloc/register/register_event.dart';
import 'package:demo_app_v1_1/bloc/register/register_state.dart';
import 'package:bloc/bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegInitialState()) {
    on<RegSubmitted>((myEvent, sendState) async {
      sendState(RegLoadingState());

      try {
        //logic to register the user
        //show success if successful
        // else show error/ failure
      }catch (e) {
        //show error msg
      }
    });
  }
}
