import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify/details/laptop_details.dart';
import 'package:shopify/details/tv_details.dart';
import 'package:shopify/details/watch_details.dart';
import 'package:shopify/details/heaphone_detail.dart';
import 'package:shopify/pages/AllProductsPage.dart';


import 'package:shopify/product/headphone.dart';
import 'package:shopify/product/laptop.dart';
import 'package:shopify/product/tv.dart';
import 'package:shopify/product/watch.dart';
import 'package:shopify/widget/support_font.dart';
class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  List categories = [
    "assets/headphone_icon.png",
    "assets/laptop.png",
    "assets/TV.png",
    "assets/watch.png",
  ];
  List categoryname = [
    "Headphone",
    "Laptop",
"TV",
"Watch",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome to Shopify",style: Appwidget.boldtextfieldstyle(),),
                      Text("Best Products",style:Appwidget.lighttextfieldstyle() ,),
                    ],
                  ),
                   ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/icon.webp",height: 50,width: 60,fit: BoxFit.cover,)),
                ],
              ),
              SizedBox(height: 30,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",style:Appwidget.semiboldtextstyle()),
                   TextButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => AllProductsPage(),
    ));
  },
  child: Text(
    "See All",
    style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 18, fontWeight: FontWeight.bold),
  ),
),
                ],
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                       height: 130,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("All",style: TextStyle( color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),))
                            ),
                    Container(
                      height: 130,
                      child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HeadphonePage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/headphone_icon.png",height: 50,width: 50,fit: BoxFit.cover,),
                           
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ),
                    ),
                     Container(
                      height: 130,
                      child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LaptopPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/laptop.png",height: 50,width: 50,fit: BoxFit.cover,),
                           
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ),
                    ),
                       Container(
                      height: 130,
                      child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WatchPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/watch.png",height: 50,width: 50,fit: BoxFit.cover,),
                           
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ),
                    ),
                      
                  ],
                ),
              ),
              SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Products",style:Appwidget.semiboldtextstyle()),
                  TextButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => AllProductsPage(),
    ));
  },
  child: Text(
    "See All",
    style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 18, fontWeight: FontWeight.bold),
  ),
),
                ],
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    
                    Container(
                       height: 240,
                       width: 150,
                       
                      child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>details()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/headphone.png",height: 100,width: 150,fit: BoxFit.cover,),
                             Text("₹799/-",style: TextStyle(color: Color(0xFFfd6f3e),fontSize: 20,fontWeight: FontWeight.bold),),
                             
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(color:Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                                child: Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                    ),
                    ),
                    
                      Container(
                       height: 240,
                       width: 150,
                       
                      child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>details1()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/laptop2.png",height: 100,width: 150,fit: BoxFit.cover,),
                             Text("₹43390/-",style: TextStyle(color: Color(0xFFfd6f3e),fontSize: 20,fontWeight: FontWeight.bold),),
                             
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(color:Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                                child: Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                    ),
                    ),
                    
                    Container(
                       height: 240,
                       width: 150,
                       
                      child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details2()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/watch2.png",height: 100,width: 150,fit: BoxFit.cover,),
                             Text("₹1499/-",style: TextStyle(color: Color(0xFFfd6f3e),fontSize: 20,fontWeight: FontWeight.bold),),
                             
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(color:Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                                child: Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                    ),
                    ),
                    
                        Container(
                       height: 240,
                       width: 150,
                       
                      child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details3()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/l1.webp",height: 100,width: 150,fit: BoxFit.cover,),
                             Text("₹7999/-",style: TextStyle(color: Color(0xFFfd6f3e),fontSize: 22,fontWeight: FontWeight.bold),),
                             
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(color:Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                                child: Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                    ),
                    ),
                      
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class categoriestile extends StatelessWidget {
  String image,name;
  categoriestile({required this.image,required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesProduct(category:name )));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image,height: 50,width: 50,fit: BoxFit.cover,),
           
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}