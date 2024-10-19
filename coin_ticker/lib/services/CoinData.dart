import '../constants.dart';
import 'networking.dart';

class CoinData {
  static const String _baseURL = "https://rest.coinapi.io/v1/exchangerate";
  static const String _APIKey = "5C0E4DB6-94D4-4EC1-B501-6FDECC402030";

  // Use lowercase for method names to follow Dart conventions
  Future<dynamic> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String requestURL = '$_baseURL/$crypto/$selectedCurrency?apikey=$_APIKey';

      NetworkHelper networkHelper = NetworkHelper(requestURL);
      var data = await networkHelper.getData();
      double price = data['rate'];

      cryptoPrices[crypto] = price.toStringAsFixed(0);
    }
    return cryptoPrices;
  }
}
