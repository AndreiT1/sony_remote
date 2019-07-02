import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'network.dart';
import 'remote_actions.dart';
import 'package:uuid/uuid.dart';
import 'package:device_info/device_info.dart';

class BraviaAPI {
  static List<RemoteAction> remoteActions = new List<RemoteAction>();
  static String url = '';
  static String auth = '1234';
  static List<String> lanIpAdress;
  static String _ircc;
  static bool status = false;

  static Future changeHdmiPort(String port) async {
    String url = BraviaAPI.url + '/avContent';
    var body = {
      'method': "setPlayContent",
      'version': "1.0",
      'id': 1,
      'params': [
        {'uri': "extInput:hdmi?port=" + port}
      ]
    };
    await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
  }

  static Future getApplicationList() async {
    String url = BraviaAPI.url + '/appControl';
    var body = {
      'method': "getApplicationList",
      'version': "1.0",
      'id': 60,
      'params': []
    };
    var resp = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    print(resp.body);
  }

  static Future changeVolume(String value) async {
    String url = BraviaAPI.url + '/audio';
    var body = {
      'method': "setAudioVolume",
      'id': 98,
      'version': "1.0",
      'params': [
        {'volume': value, 'ui': 'on', 'target': "speaker"}
      ],
    };
    await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
  }

  static Future muteVolume(bool mute) async {
    String url = BraviaAPI.url + '/audio';
    var body = {
      'method': "setAudioMute",
      'id': 601,
      'version': "1.0",
      'params': [
        {'status': mute}
      ],
    };
    var resp = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    return resp.body;
  }

  static Future setWolMode(bool mode) async {
    String url = BraviaAPI.url + '/system';
    var body = {
      'method': "setWolMode",
      'id': 55,
      'version': "1.0",
      'params': [
        {'enabled': mode}
      ],
    };
    var resp = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    return resp.body;
  }

  static Future setPowerStatus(bool status) async {
    String url = BraviaAPI.url + '/system';
    var body = {
      'method': "setPowerStatus",
      'id': 601,
      'version': "1.0",
      'params': [
        {'status': status}
      ],
    };
    var resp = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    return resp.body;
  }

  static Future getVolumeInformation() async {
    String url = BraviaAPI.url + '/audio';
    var body = {
      'method': "getVolumeInformation",
      'id': 33,
      'version': "1.0",
      'params': [],
    };
    var response = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    var resp = jsonDecode(response.body);
    return resp['result'][0][0]['mute'];
  }

  static Future sendCommand(String action) async {
    String ircc;
    BraviaAPI.remoteActions.forEach((element) {
      if (element.action == action) {
        print("action is $action");
        ircc = element.value;
      }
    });

    String soap = '''<s:Envelope
    xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"
    s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <s:Body>
        <u:X_SendIRCC xmlns:u="urn:schemas-sony-com:service:IRCC:1">
            <IRCCCode>$ircc</IRCCCode>
        </u:X_SendIRCC>
    </s:Body>
    </s:Envelope>''';
    String url = BraviaAPI.url + '/IRCC';
    var resp = await http.post(
      url,
      headers: {
        'Accept': "*/*",
        'Content-Type': "text/xml;charset=UTF-8",
        'X-Auth-PSK': BraviaAPI.auth,
        'SOAPAction': "urn:schemas-sony-com:service:IRCC:1#X_SendIRCC",
        'Connection': "Keep-Alive"
      },
      body: utf8.encode(soap),
    );
    return resp.body;
  }

  static Future getRemoteControllerInfo() async {
    var url = BraviaAPI.url + '/system';
    var body = {
      'method': "getRemoteControllerInfo",
      'id': 54,
      'params': [],
      'version': "1.0",
    };
    var response = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    var resp = jsonDecode(response.body);
    return resp;
  }

  static Future authCoookie() async {
    var uuidObj = new Uuid();
    var uuid = uuidObj.v1();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

    var url = 'http://192.168.0.102/sony/accessControl';
    String myNick = 'Andrei';
    var body = {
      'method': "actRegister",
      'id': 8,
      'params': [
        {
          'clientid': "Andrei:" + uuid,
          'nickname': "Andrei(" + androidInfo.model + ")",
          'level': "private"
        },
        [
          {'value': "yes", 'function': "WOL"}
        ]
      ],
      'version': "1.0",
    };
    var response = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    print(response);
    var resp = jsonDecode(response.body);
    print(resp);
    print(uuid);
    return uuid;
  }

  static Future authCoookie2(var uuid) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

    var url = 'http://192.168.0.102/sony/accessControl';
    String myNick = 'Andrei';
    var body = {
      'method': "actRegister",
      'id': 8,
      'params': [
        {
          'clientid': "Andrei:" + uuid,
          'nickname': "Andrei(" + androidInfo.model + ")",
          'level': "private"
        },
        [
          {'value': "yes", 'function': "WOL"}
        ]
      ],
      'version': "1.0",
    };
    String authorization = 'Basic 2179';
    var bytes = utf8.encode(authorization);
    var base64Str = base64.encode(bytes);
    var response = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8",
      'Authorization': base64Str
    });
    print(response);
    var resp = jsonDecode(response.body);
    print(resp);
    return resp;
  }

  static Future getNetworkSettings() async {
    var url = BraviaAPI.url.toString() + '/system';
    var body = {
      'method': "getNetworkSettings",
      'id': 2,
      'params': [
        {'netif': "eth0"}
      ],
      'version': "1.0",
    };
    var response = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    var resp = jsonDecode(response.body);
    print(resp);
    return resp;
  }

  static Future getPowerStatus() async {
    var url = BraviaAPI.url + '/system';
    var body = {
      'method': "getPowerStatus",
      'id': 50,
      'params': [],
      'version': "1.0",
    };
    var response = await http.post(url, body: jsonEncode(body), headers: {
      'X-Auth-PSK': BraviaAPI.auth,
      'Content-Type': "application/json; charset=utf-8"
    });
    if (response != null) {
      var resp = jsonDecode(response.body);
      print("getPowerStatus() + $resp");
      String status = resp['result'][0]['status'];
      print(status);
      return status;
    }
    return null;
  }

  static List<RemoteAction> getRemoteActions(var resp) {
    for (int i = resp['result'][1].length - 1; i >= 0; i--) {
      RemoteAction remoteAction =
          new RemoteAction.fromJson(resp['result'][1][i]);
      remoteActions.add(remoteAction);
    }
    return remoteActions;
  }

  static Future<dynamic> isConnectionSuccesfull() async {
    return Network.getIpAdresses().then((resp) async {
      print('getIpAdresses() $resp');
      for (String ipAdress in resp) {
        print('value of status is $status');
        if (BraviaAPI.status == false) {
          String host = "http://" + ipAdress.toString() + "/sony";
          BraviaAPI.url = host;
          print("braviaAPI url is ${BraviaAPI.url}");
          try {
            var powerStatus = await BraviaAPI.getPowerStatus();
            print('powerStatus $powerStatus');
            if (powerStatus != null) {
              BraviaAPI.status = true;
              return true;
            } else {
              BraviaAPI.status = false;
              return false;
            }
          } catch (e) {
            print(e.toString());
          }
        }
      }
    });
  }
}
