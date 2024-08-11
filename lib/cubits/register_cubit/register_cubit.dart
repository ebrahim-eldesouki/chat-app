import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          emit(RegisterSuccess()) ; 
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(errorMassage: 'weak-password')) ;
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMassage: 'email already in use ')) ;
      }
    } catch (e) {
        emit(RegisterFailure(errorMassage: 'there was an error please try again ')) ;
    }
  }
}
