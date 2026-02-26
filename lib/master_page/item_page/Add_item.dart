import 'package:flutter/material.dart';
import '../../data/db_helper.dart';
import 'add_new_design.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  List<Map<String, dynamic?>> mAddItem = [];

  DbHelper? dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper.getInstance();
    loadData();
  }
  loadData()async{
     mAddItem = await dbHelper!.getAllItem();
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Select Item", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          mAddItem.isNotEmpty? ListView.builder(
              itemCount: mAddItem.length,
              itemBuilder: (ctx, index){
                return Card(
                  child: ListTile(
                    title: InkWell(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> AddItem()));
                        },
                        child: Text(mAddItem[index]['designName'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),)),
                    leading: Text("₹${mAddItem[index]['salePrice'].toString()}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                    trailing: Text(mAddItem[index]['designTags'] ?? ""),
                    subtitle: Text(mAddItem[index]['description'] ?? ""),
                  ),
                );
              }):Center(child: Text("No item yet!"),),
          Padding(
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
                          loadData();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewDesign()));
                        }, child: Text("Add New item")),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
