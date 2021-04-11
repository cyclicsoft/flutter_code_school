import 'package:flutter_code_school/core/services/api.dart';
import 'package:flutter_code_school/core/services/authentication_seervice.dart';
import 'package:flutter_code_school/core/services/post_service.dart';
import 'package:flutter_code_school/core/viewmodels/home_model.dart';
import 'package:flutter_code_school/core/viewmodels/like_button_model.dart';
import 'package:flutter_code_school/core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

import 'core/viewmodels/comments_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => PostService());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => LikeButtonModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
