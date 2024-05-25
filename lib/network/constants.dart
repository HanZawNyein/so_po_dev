// lib/constants.dart

class Constants {
  static const String _hostName = '172.20.10.3:8069';
  static const String apiHost = 'http://$_hostName/api';

  // Endpoints
  static const String loginEndpoint = '$apiHost/login';
}
