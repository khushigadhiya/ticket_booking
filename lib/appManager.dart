import 'package:booktickets/utils/models.dart';

class AppManager{
  static final AppManager instance = AppManager._internal();
  List<Ticket> tickets = [];

  factory AppManager(){
    return instance;
  }

  AppManager._internal(){

  }

}

