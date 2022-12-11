import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN_KEY';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN_KEY';

final emulatorIp = '10.0.2.2';
final simulatorIp = '127.0.0.1';
final port = '3040';


// final String ip = Platform.isIOS ? simulatorIp : emulatorIp;
final ip = '192.168.0.2';

final API_URL = 'http://$ip:$port';

const storage = FlutterSecureStorage();
