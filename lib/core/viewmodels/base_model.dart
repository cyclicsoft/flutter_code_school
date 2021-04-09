import 'package:flutter/material.dart';
import 'package:flutter_code_school/core/enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;

  ViewState get viewState => _viewState;

  void setState(ViewState viewState){
    _viewState = viewState;
    notifyListeners();
  }

}