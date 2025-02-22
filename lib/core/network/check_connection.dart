import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';



class DeviceConnection  {
  final InternetConnection internetConnectionChecker;

  DeviceConnection({required this.internetConnectionChecker});
  
  Future<bool> get deviceConnected => internetConnectionChecker.hasInternetAccess;
}
