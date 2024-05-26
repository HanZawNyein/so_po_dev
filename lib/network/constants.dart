// lib/constants.dart

class Constants {
  static const String _hostName = '172.20.10.3';
  static const String _portName = '8069';
  static const String apiHost = 'http://$_hostName:$_portName/api';

  // Endpoints
  static const String loginEndpoint = '$apiHost/login';
}
