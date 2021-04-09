import 'package:flutter/material.dart';
import 'package:flutter_code_school/core/enums/viewstate.dart';
import 'package:flutter_code_school/core/services/authentication_seervice.dart';
import 'package:flutter_code_school/core/viewmodels/base_model.dart';
import 'package:flutter_code_school/locator.dart';
class LoginModel extends BaseModel{

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMsg;

  Future<bool> login(String userIdText) async{
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    if(userId == null){
      errorMsg = 'Value entered is not a digit';
      setState(ViewState.Idle);
      return false;
    }
    if( 1 <= userId && userId <=10 ){
      var success = await _authenticationService.login(userId);
      setState(ViewState.Idle);
      return success;
    }
    errorMsg = 'Value entered is not in range';
    setState(ViewState.Idle);
    return false;
  }

  // close Stream
  @override
  void dispose() {
    super.dispose();
    _authenticationService.dispose();
  }

}