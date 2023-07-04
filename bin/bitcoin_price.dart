import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.https('api.coindesk.com', '/v1/bpi/currentprice.json');
  var response = await http.get(url);
  printBTC(response.body);
}

void printBTC(var message){
  var decode = json.decode(message);
  print(decode);
  var time = decode['time'];
  var date = time['updated'];
  var priceMessage = decode['bpi'];
  var usd = priceMessage['USD'];
  var btcPrice = usd['rate'];

  print('\nThe current price of Bitcoin according to coindesk.com');
  print('Date: $date');
  changeToLocal(time['updatedISO']);
  print('Price: \$$btcPrice');
}

void changeToLocal(var time){
  var currentTime = DateTime.parse(time);
  var localTime = currentTime.toLocal();
  print('Local time: $localTime');
}
