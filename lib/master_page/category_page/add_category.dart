import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Add Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Container(
                    width: 200,
                    height: 300,
                    child: Column(
                      children: [
                        Text("Category Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                        SizedBox(height: 21),
                        TextField(
                          decoration: InputDecoration(
                            hint: Text("Category Type Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

                          ),
                        ),
                      ],
                    ),
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Text("Save")),
                      SizedBox(width: 21,),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        

                          child: Text("Cancel")),
                    ],
                    
                  ),

                );
              });

            }, child: Text("Add Category")),

        ],
        ),
      ),
    );
  }
}
