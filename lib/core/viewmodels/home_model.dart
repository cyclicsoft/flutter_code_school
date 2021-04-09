import 'package:flutter_code_school/core/enums/viewstate.dart';
import 'package:flutter_code_school/core/models/post.dart';
import 'package:flutter_code_school/core/services/api.dart';
import 'package:flutter_code_school/core/viewmodels/base_model.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async{
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}