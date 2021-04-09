import 'package:flutter/material.dart';
import 'package:flutter_code_school/core/models/user.dart';
import 'package:flutter_code_school/core/services/authentication_seervice.dart';
import 'package:flutter_code_school/ui/router.dart' as approuter;
import 'package:provider/provider.dart';

import 'locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>(
      initialData: User.initial(),
      create: (_) => locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: approuter.Router.generateRoute,
      ),
    );
  }
}