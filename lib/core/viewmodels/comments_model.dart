import 'package:flutter_code_school/core/enums/viewstate.dart';
import 'package:flutter_code_school/core/models/comment.dart';
import 'package:flutter_code_school/core/services/api.dart';

import '../../locator.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}