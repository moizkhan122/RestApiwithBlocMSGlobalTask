import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/TabbarView/UI/TabbarUI.dart';
import '../bloc/login_screen_bloc.dart';
import '../bloc/login_screen_event.dart';
import '../bloc/login_screen_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc authBloc = AuthBloc();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      body:  BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {          
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return TabScreen();
            }),
          );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content:Text(state.error))
            );
          }
        },
        builder: (context, state) {
          return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/splashScreen.jpeg'),
                const SizedBox(height: 15,),
                Container(
                  color: Colors.grey.withOpacity(0.2),
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: 'username',
                      border: InputBorder.none,
                      
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  color: Colors.grey.withOpacity(0.2),
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration:  InputDecoration(
                      suffixIcon: InkWell(
                        onTap: (){},
                        child: const Icon(Icons.visibility)),
                      hintText: 'Password',
                      border: InputBorder.none,
                      
                    ),
                  ),
                ),
          
                const SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red
                    ),
                    onPressed: () {
                      final username = _usernameController.text;
                      final password = _passwordController.text;
                      authBloc.add(AuthLoginRequested(
                            username: username,
                            password: password,
                          ));
                    }, 
                    child: const Center(child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),)),
                )
                  
              ]),
          ),
        ),
      );
        },
      )  );
  }
}