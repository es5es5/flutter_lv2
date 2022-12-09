import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN_KEY';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN_KEY';

const emulatorIp = '10.0.2.2';
const simulatorIp = '127.0.0.1';
const port = '3040';

final String ip = Platform.isIOS ? simulatorIp : emulatorIp;

const storage = FlutterSecureStorage();
