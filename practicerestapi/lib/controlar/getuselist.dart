
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicerestapi/controlar/getdata.dart';
import 'package:practicerestapi/model/user.dart';
import 'package:http/http.dart' as http;

class UserList extends  GetxController{

   final userlist=<Usermodel>[].obs;
   var isvalue=false.obs;

   @override
  void onInit() {
    getdatalist();
   
    super.onInit();
  }

  getdatalist() async{
    isvalue=true.obs;
    try{

      var respons= await http.get(Uri.parse(Api.GET_DATA));
      if(respons.statusCode==200){
        var jsoncode=jsonDecode(respons.body); 
        List<Usermodel>model=[];
         for(var userlists in jsoncode){
          model.add(Usermodel(userId: userlists["userId"], id: userlists["id"], title: userlists["title"], completed: userlists["completed"]));

         }
         userlist.assignAll(model);
         isvalue(false);
      }

    }catch(e){
      print(e);
    }



  }





}