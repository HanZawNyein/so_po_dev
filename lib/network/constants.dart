// lib/constants.dart

class Constants {
  static const String _hostName = '192.168.43.134';
  static const String _portName = '8069';
  static const String apiHost = 'http://$_hostName:$_portName/api';

  // Endpoints
  static const String loginEndpoint = '$apiHost/login';
}