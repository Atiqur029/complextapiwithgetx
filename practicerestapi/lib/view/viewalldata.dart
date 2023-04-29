import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicerestapi/controlar/getdata2.dart';

import '../controlar/getuselist.dart';

class ViewAllDAta extends StatelessWidget {
   ViewAllDAta({super.key});
  final listview=Get.put(UserList());
    final pagemodeldata=Get.put(Getdatapage());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding:EdgeInsets.all(10),child: Obx((){
        return pagemodeldata.isprocess==true.obs?const Center(child: CircularProgressIndicator(),):  ListView.builder(
          itemCount: pagemodeldata.model!.data!.length,
          itemBuilder: (context,index){
            final useralldetails=pagemodeldata.model!.data![index];
            return Text(useralldetails.firstName.toString(),style: const TextStyle(color: Colors.black),);

        });
      }),),
      
    );
  }
}

