import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_edu/home/post.dart';

class HomeWordSeeMore extends StatelessWidget {
  const HomeWordSeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(),
      child: MaterialApp(
        title: '더 보기',
        home: SeeMore(),
      ),
    );
  }
}
 class SeeMore extends StatefulWidget {
   const SeeMore({Key? key}) : super(key: key);

   @override
   _SeeMoreState createState() => _SeeMoreState();
 }

 class _SeeMoreState extends State<SeeMore> {
   final _scrollController = ScrollController();
   late PostBloc _postBloc;

   @override
   void initState() {
     super.initState();
     _scrollController.addListener(_onScroll);
     _postBloc = BlocProvider.of<PostBloc>(context);
     _postBloc.add(PostEvent.getPosts);
   }


   @override
   Widget build(BuildContext context) {
     return BlocBuilder<PostBloc, PostState>(
       builder: (context, state) {
         switch (state.status) {
           case PostStatus.initial:
             return Center(
               child: CircularProgressIndicator(),
             );
           case PostStatus.failure:
             return Center(
               child: Text('failed to fetch posts'),
             );
           default:
             if (state.posts.isEmpty) {
               return Center(
                 child: Text('no posts'),
               );
             } else
               return ListView.builder(
                 itemBuilder: (context, index) {
                   return index >= state.posts.length
                       ? BottomLoader()
                       : PostItem(post: state.posts[index]);
                 },
                 itemCount: state.posts.length + 1,
                 controller: _scrollController,
               );
         }
       },
     );
   }

   @override
   void dispose() {
     _scrollController.dispose();
     super.dispose();
   }

   void _onScroll() {
     if (_isBottom) {
       _postBloc.add(PostEvent.getPosts);
     }
   }

   bool get _isBottom {
     if (!_scrollController.hasClients) return false;
     final maxScroll = _scrollController.position.maxScrollExtent;
     final currentScroll = _scrollController.position.pixels;
     return currentScroll >= (maxScroll * 0.9);
   }
 }
