import 'package:googleclone/API-Keys.dart';
import 'package:http/http.dart 'as http;
import 'dart:convert';

import 'api_json.dart';
class ApiService{
  bool isDummyData=false;
  Future<Map<String,dynamic>> fetchData({
    required String queryTerm,
    String start="0" })async{
    try{
if(!isDummyData){
  String q=queryTerm.contains(' ')?queryTerm.split('  ').join('%20'):queryTerm;
  final response =await http.get(
    Uri.parse(
        'https://www.googleapi.com/customsearch/v1?key=${apikey}&cx=$contextkey$q=$q&start=$start'
    ),
  );
  if(response.statusCode==200){
    final jsonData=response.body;
    final respData=json.decode(jsonData);
    return respData;
  }
}
    }catch(e){
      print(e.toString(),
      );
    }
    return apiResponse;
  }

}