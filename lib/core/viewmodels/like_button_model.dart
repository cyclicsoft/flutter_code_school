import 'package:flutter_code_school/core/services/post_service.dart';
import 'package:flutter_code_school/core/viewmodels/base_model.dart';

import '../../locator.dart';

class LikeButtonModel extends BaseModel{
  PostService _postsService = locator<PostService>();

  void increaseLikes( int postId){
    _postsService.incrementLikes(postId);
    notifyListeners();
  }

  int postLikes(int postId){
    return _postsService.posts
        .firstWhere((post) => post.id == postId)
        .likes;
  }
}