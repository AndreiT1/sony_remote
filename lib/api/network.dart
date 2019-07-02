import 'package:wifi/wifi.dart';
import 'package:ping_discover_network/ping_discover_network.dart';

class Network {
  static getIpAdresses() async {
    String ip = await Wifi.ip;
    final String subnet = ip.substring(0, ip.lastIndexOf('.'));
    final int port = 80;
    List<String> lanAdresses = new List<String>();

    final stream = NetworkAnalyzer.discover(subnet, port);
    await for (NetworkAddress addr in stream) {
      if (addr.exists) {
        print('Found device: ${addr.ip} ');
        lanAdresses.add(addr.ip.toString());
      }
    }
    return lanAdresses;
  }
}
