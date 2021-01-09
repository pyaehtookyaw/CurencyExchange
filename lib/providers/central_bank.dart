import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class CentralBankRateProvider with ChangeNotifier {
  Future getCurrencyRate() async {
    try {
      final url = "http://forex.cbm.gov.mm/api/latest";
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          'Content-type': 'application/json',
        },
        // body: json.encode({
        //   'userID': userId.toString(),
        //   'deviceID': deviceId.toString(),
        // }),
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print("My response data");
        print(data);
        return data;
      } else {
        throw Exception('Failed to load paymentType');
      }
    } on FormatException catch (e) {
      print("FormatException" + e.toString());
      throw "Service link's name is not correct !";
    } on TimeoutException catch (e) {
      print("TimeOutExecption" + e.toString());
      throw "Can not connect right now !";
    } on SocketException catch (e) {
      print("SocketException" + e.toString());
      throw "Can not connect right now.Please try again later !";
    } catch (e) {
      print("CheckOTP Error");
      throw e.toString();
    }
  }
}
