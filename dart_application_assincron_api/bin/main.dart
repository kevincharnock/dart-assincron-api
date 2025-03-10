
import 'package:http/http.dart';
import 'dart:convert';

void main(){

// requestData();
// requestDataAsync();
// requestDataBooksAsync();
testeMap("Haley");
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
 
//Funcao de fato assincrona
//await sempre depois de uma função que retorna future
requestDataAsync () async {
  const String url = "https://gist.githubusercontent.com/kevincharnock/194434b04e545cac42eb5273503604b7/raw/3e7e32f3f123e4c19e9366f6bdc2fec9b8f2eb8b/accounts.json";
  Response response= await get(Uri.parse(url));
  print(json.decode(response.body)[3]);
} 

//Step1
requestDataBooksAsync () async {
  const String url = "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/books.json";
  const String url1 = "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/recipes.json";

  Response response = await get(Uri.parse(url1));
  
  //Usando decoder
  // print(json.decode(response.body)[0]);
  print(response.body);
}

sendDataAsync (Map<String, dynamic> data) async {
  const String url = "https://gist.githubusercontent.com/kevincharnock/194434b04e545cac42eb5273503604b7/raw/3e7e32f3f123e4c19e9366f6bdc2fec9b8f2eb8b/accounts.json";
  Response response = await post(Uri.parse(url), body: json.encode(data));
  print(response.body);

}

testeMap(String nome){
  Map<String, int> idadePessoas = {
  'Haley': 22,
  'Abigail': 19,
  'Sebastian': 20, 
};
 return print(idadePessoas[nome]);

}