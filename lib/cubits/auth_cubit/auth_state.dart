part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}
final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginFailure extends AuthState {
  final String errorMassage ; 
  LoginFailure({required this.errorMassage}) ; 
}
final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {}
final class RegisterFailure extends AuthState {
 final String errorMassage ;

  RegisterFailure({required this.errorMassage}); 
}
