import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashInitialState()) {
    on<SplashInitialEvent>(splashInitialEvent);
  }

  FutureOr<void> splashInitialEvent(SplashInitialEvent event, Emitter<SplashScreenState> emit) {
    emit(SplashInitialState());
  }
}
