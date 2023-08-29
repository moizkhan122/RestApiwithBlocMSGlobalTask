import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'login_screen_event.dart';
import 'login_screen_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()){
    on<AuthLoginRequested>(authLoginRequested);
  }
  

  Future<FutureOr<void>> authLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final response = await http.get(
         Uri.parse('https://jsonplaceholder.typicode.com/users?name=${event.username}&username=${event.password}',),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          emit(AuthSuccess());
        } else {
           emit(const AuthFailure(error: 'Authentication failed'));
        }
      } else {
        emit(const AuthFailure(error: 'Authentication failed'));
      }
    } catch (e) {
      emit(const AuthFailure(error: 'Authentication failed'));
    }
  }
}

