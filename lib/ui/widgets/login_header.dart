import 'package:flutter/material.dart';
import 'package:flutter_code_school/ui/shared/text_styles.dart';
import 'package:flutter_code_school/ui/shared/ui_helpers.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;
  final bool isEnable;

  LoginHeader({@required this.controller, this.validationMessage, this.isEnable});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Login', style: headerStyle),
      UIHelper.verticalSpaceMedium(),
      Text('Enter a number between 1 - 10', style: subHeaderStyle),
      LoginTextField(controller, this.isEnable),
      this.validationMessage != null
          ? Text(validationMessage, style: TextStyle(color: Colors.red))
          : Container()
    ]);
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnable;

  LoginTextField(this.controller, this.isEnable);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
          decoration: InputDecoration.collapsed(hintText: 'User Id'),
          controller: controller,
          enabled: this.isEnable,
      ),
    );
  }
}