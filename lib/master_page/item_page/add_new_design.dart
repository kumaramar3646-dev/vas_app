import 'package:flutter/material.dart';

class AddNewDesign extends StatelessWidget {
  const AddNewDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Add New Design", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            Icon(Icons.category_outlined,size: 300,color: Colors.grey.shade300,),
            TextField(
              decoration: InputDecoration(
                hint: Text("Design Name/Number", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hint: Text("Sale Price", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hint: Text("Description", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hint: Text("Design Tags", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 31,),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: (){

                  Navigator.pop(context);
                }, child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Save", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                    SizedBox(width: 11),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
