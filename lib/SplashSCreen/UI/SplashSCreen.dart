
import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginSCreen/UI/LoginScreem.dart';
import 'package:flutter_application_1/SplashSCreen/bloc/splash_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenBloc splashScreenBloc = SplashScreenBloc();
  @override
  void initState() {
    splashScreenBloc.add(SplashInitialEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        bloc: splashScreenBloc,
        listenWhen: (previous, current) => current is SplashInitialState,
        listener: (context, state) {
          if (state is SplashInitialState) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) 
              =>   const LoginScreen(),));
          });
          }
        },
        child: Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/splashScreen.jpeg'))),),
      ),
    );
  }
}