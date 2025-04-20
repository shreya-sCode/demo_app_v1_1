import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo_app_v1_1/bloc/posts/post_event.dart';
import 'package:demo_app_v1_1/bloc/posts/post_state.dart';
import 'package:demo_app_v1_1/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitialState()) {
    on<PostFetchEvent>((myEvent, sendState) async {

      sendState(PostLoadingState());

      try {
        final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        );

        if (response.statusCode == 200) {
          final List<dynamic> jsonData = json.decode(response.body);
          final posts = jsonData.map((item) => Posts.fromJson(item)).toList();

          sendState(PostLoadedState(posts: posts));
        } else {
          sendState(PostErrorState(message: 'Failed to laod Posts'));
        }
      } catch (e) {
        sendState(PostErrorState(message: e.toString()));
      }
    });
  }
}
