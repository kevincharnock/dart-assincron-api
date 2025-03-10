
import 'package:http/http.dart';
import 'dart:convert';

void main(){

requestData();
}

//Func pra fazer a requisição do gist
requestData(){
  const String url = "https://gist.githubusercontent.com/kevincharnock/194434b04e545cac42eb5273503604b7/raw/3e7e32f3f123e4c19e9366f6bdc2fec9b8f2eb8b/accounts.json";
  Future<Response> futureResponse =  get(Uri.parse(url)); 

  // print(futureResponse);

  //Trazendo response do future assincrono
  futureResponse.then((Response rawResponse) {
    // print(rawResponse.body);

    // print(rawResponse.body);    
    List<dynamic> data = jsonDecode(rawResponse.body);
    //Método buscando por um campo específico
    data.firstWhere((element) => element['name'] == 'Carla', orElse: () => null);
    Map<String, dynamic> carla = data.firstWhere((element) => element['name'] == 'Carla', orElse: () => null);
  
   print(carla["balance"]);

  },);
}