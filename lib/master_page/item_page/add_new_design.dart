import 'package:flutter/material.dart';
import 'package:vas_app/data/db_helper.dart';
import 'package:vas_app/data/model/item_model.dart';

class AddNewDesign extends StatefulWidget {
  const AddNewDesign({super.key});

  @override
  State<AddNewDesign> createState() => _AddNewDesignState();
}

class _AddNewDesignState extends State<AddNewDesign> {
  var DesignNameController = TextEditingController();
  var SalePriceController = TextEditingController();
  var DescriptionController = TextEditingController();
  var DesignTagsController = TextEditingController();

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
  List<Map<String, dynamic?>> mAddItem = [];


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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(backgroundColor: Colors.blue,radius: 31, child: IconButton(onPressed: (){}, icon: Icon(Icons.image,color: Colors.white,)),),
                SizedBox(width: 21,),
                CircleAvatar(backgroundColor: Colors.blue,radius: 31, child: IconButton(onPressed: (){}, icon: Icon(Icons.picture_as_pdf_rounded,color: Colors.white,)),),
                SizedBox(width: 21,),
                CircleAvatar(backgroundColor: Colors.blue,radius: 31, child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt,color: Colors.white,)),),
              ],
            ),
            TextField(
              controller: DesignNameController,
              decoration: InputDecoration(
                hint: Text("Design Name/Number", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
            ),
            TextField(
              controller: SalePriceController,
              decoration: InputDecoration(
                hint: Text("Sale Price", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
            ),
            TextField(
              controller: DescriptionController,
              decoration: InputDecoration(
                hint: Text("Description", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ),
            ),
            TextField(
              controller: DesignTagsController,
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
                onPressed: ()async{
                   bool isAdded = await DbHelper.getInstance().addItem(
                      addNewItem: ItemModel(
                        id: null,
                        designName: DesignNameController.text,
                        salePrice: SalePriceController.text.isNotEmpty ? int.parse(SalePriceController.text) : null,
                        description: DescriptionController.text,
                        designTags: DesignTagsController.text,
                      ));
                   if(isAdded){
                     loadData();
                     ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text("Item Added Successfully"),backgroundColor: Colors.green.shade300,));
                   }
                   /// space clear
                   DesignNameController.clear();
                   SalePriceController.clear();
                   DescriptionController.clear();
                   DesignTagsController.clear();
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
