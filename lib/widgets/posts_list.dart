import 'package:demo_app_v1_1/bloc/posts/post_bloc.dart';
import 'package:demo_app_v1_1/bloc/posts/post_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_app_v1_1/bloc/posts/post_state.dart';
// import 'package:demo_app_v1_1/bloc/posts/post_bloc.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(PostFetchEvent()),
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoadedState) {
            final postsReady = state.posts;
            return ListView.builder(
              itemBuilder: (context, index) {
                final post = postsReady[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (state is PostErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
