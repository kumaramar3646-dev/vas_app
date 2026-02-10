import 'package:flutter/material.dart';
import 'package:vas_app/master_page/item_page/add_new_design.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Select Item", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 21,left: 21),
        child: Container(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewDesign()));
                    }, child: Text("Add New item")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
