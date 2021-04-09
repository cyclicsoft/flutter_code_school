import 'package:flutter/material.dart';
import 'package:flutter_code_school/core/enums/viewstate.dart';
import 'package:flutter_code_school/core/viewmodels/login_model.dart';
import 'package:flutter_code_school/ui/shared/app_color.dart';
import 'package:flutter_code_school/ui/views/base_view.dart';
import 'package:flutter_code_school/ui/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              model.viewState == ViewState.Idle
              ?LoginHeader(
                validationMessage: model.errorMsg,
                controller: _textEditingController,
                isEnable: true,
              )
                  : LoginHeader(
                validationMessage: model.errorMsg,
                controller: _textEditingController,
                isEnable: false,
              ),
              model.viewState == ViewState.Busy
              ? CircularProgressIndicator()
                  : FlatButton(
                  color: Colors.white,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    var loginSuccess = await model.login(_textEditingController.text);
                    if (loginSuccess) {
                      // Navigate to the home view
                      Navigator.pushNamed(context, '/');
                    }
                  }),

            ],
          ),
        ),
      );
  }
}