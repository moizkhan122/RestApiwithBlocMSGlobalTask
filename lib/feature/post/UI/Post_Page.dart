import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/post/bloc/post_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Post_Page extends StatefulWidget {
  const Post_Page({super.key});

  @override
  State<Post_Page> createState() => _Post_PageState();
}

// ignore: camel_case_types
class _Post_PageState extends State<Post_Page> {
  PostBlocBloc postBloc = PostBlocBloc();
  @override
  void initState() {
    postBloc.add(PostBlocInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PostBlocBloc, PostBlocState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostBlocActionState,
        buildWhen: (previous, current) => current is !PostBlocActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostBlocLoadingState:
            return const Center(child: CircularProgressIndicator(color: Colors.green,),);
            case FetchingDataSuccessState:
              final successState = state as FetchingDataSuccessState;
              return ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  color: Colors.grey.shade300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('Title '+'$index',style: TextStyle(fontSize: 20)),
                      Text(successState.posts[index].title),
                    ]),
                );
              },);
            default:
            return const SizedBox();
          }
        },
      ),
    );
  }
}