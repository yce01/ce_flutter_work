import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

enum PostEvent { getPosts }
enum PostStatus { initial, success, failure }

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  Post({required this.title, required this.body, required this.id})
      : assert(title != null && body != null && id != null);

  @override
  List<Object> get props => [id, title, body];

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

class PostState extends Equatable {
  final PostStatus status;
  final List<Post> posts;
  final int lastPostId;

  PostState(
      {this.status = PostStatus.initial, required this.posts, this.lastPostId = 0});

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    int? lastPostId,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      lastPostId: lastPostId ?? this.lastPostId,
    );
  }

  @override
  List<Object> get props => [status, posts, lastPostId];
}

class ApiHelper {
  final String url;

  ApiHelper({required this.url});

  Future getData() async {
    try {
      var response = await http.get(this.url as Uri);
      if (response.statusCode != 200)
        throw Exception('${response.statusCode}');
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } catch (e) {
      throw e;
    }
  }
}

// class PostEventGetPost extends PostEvent {}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostState(posts: [])){
    // on<PostEventGetPost>((event, emit) => emit());
  }

  final int _postLimit = 20;

  EventTransformer<PostEvent> transform<PostEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  // Stream<Transition<PostEvent, PostState>> transformEvents(
  //     Stream<PostEvent> events, transitionFn) {
  //   return super.transformEvents(
  //       events.debounceTime(const Duration(milliseconds: 500)), transitionFn);
  // }

  Stream<PostState> mapEventToState(PostEvent event) async* {
    switch (event) {
      case PostEvent.getPosts:
        try {
          if (state.lastPostId != 100) {
            final posts = await _fetchPosts(state.lastPostId, _postLimit);
            yield state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              lastPostId: posts.last.id,
            );
            break;
          } else {
            final posts = await _fetchPosts(0, _postLimit);
            yield state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                lastPostId: _postLimit);
          }
        } catch (e) {
          yield state.copyWith(status: PostStatus.failure);
        }
    }
  }

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    ApiHelper apiHelper =
    ApiHelper(url: 'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');

    final response = await apiHelper.getData();
    List<Post> _posts = [];
    response.forEach((postRaw) {
      _posts.add(Post.fromJson(postRaw));
    });
    return _posts;
  }
}

class PostItem extends StatelessWidget {
  final Post post;

  PostItem({required this.post}) : assert(post != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${post.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}