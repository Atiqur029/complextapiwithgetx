import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:practicerestapi/controlar/api2.dart';
import 'package:practicerestapi/model/pagemodel.dart';

class Getdatapage extends GetxController{
  var isprocess=false.obs;

   PageModel? model;

   @override
  void onInit() {
    getdata();
    super.onInit();
  }
  
  getdata()async {
    isprocess=true.obs;

    var respons=await http.get(Uri.parse(Api2.getdata));

    if(respons.statusCode==200){
      try{
        var responsdata=jsonDecode(respons.body);
        model=PageModel.fromJson(responsdata);
        isprocess(false);
        

      } catch(e){
        print("Database Error is $e");
      }
    }



  }



}