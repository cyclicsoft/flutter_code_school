import 'package:flutter_code_school/core/enums/viewstate.dart';
import 'package:flutter_code_school/core/models/post.dart';
import 'package:flutter_code_school/core/services/post_service.dart';
import 'package:flutter_code_school/core/viewmodels/base_model.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  PostService _postService = locator<PostService>();

  List<Post> get posts => _postService.posts;

  Future getPosts(int userId) async{
    setState(ViewState.Busy);
    await _postService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}