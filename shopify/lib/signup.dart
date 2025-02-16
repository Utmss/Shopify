
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shopify/login.dart';
import 'package:shopify/pages/bottom_nav.dart';
import 'package:shopify/pages/home.dart';
import 'package:shopify/services/database.dart';
import 'package:shopify/services/shared_pref.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  String name = "", email = "",password = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  registration()async{
    if(password != "" && name != "" && email != ""){
      try{
UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
ScaffoldMessenger.of(context).showSnackBar((SnackBar(
  backgroundColor: Colors.orangeAccent,
  content: Text('Registered Successfully',style: TextStyle(fontSize: 20),))));
 String Id = randomAlphaNumeric(10);
 await SharedpreferenceHelper().saveuseremail(mailcontroller.text);
 await SharedpreferenceHelper().saveuserid(Id);
 await SharedpreferenceHelper().saveuserprofile("https://firebasestorage.googleapis.com/v0/b/foodie-5dfeb.appspot.com/o/blogimages%2Fr61012a850?alt=media&token=3e361ca8-4aab-485e-905c-9b6465ea0c51");
 await SharedpreferenceHelper().saveusername(namecontroller.text);
 Map<String,dynamic>userinfomap = {
"Name" :namecontroller.text,
"Email": mailcontroller.text,
"id":Id,
"image" : "https://firebasestorage.googleapis.com/v0/b/foodie-5dfeb.appspot.com/o/blogimages%2Fr61012a850?alt=media&token=3e361ca8-4aab-485e-905c-9b6465ea0c51"
  };
  await Databasemethod().adduserdetail(userinfomap, Id);
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomNav()));
      }on FirebaseException catch(e){
        if(e.code == 'weak-password'){
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('Password Provide is so Weak',style: TextStyle(fontSize: 18),))));
        }
        else if(e.code == 'email already registered'){
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('Already Account exits',style: TextStyle(fontSize: 18),))));
        }
      }
    }
  }
 @override
  Widget build(BuildContext context) {
    return   Scaffold(
    body:   SingleChildScrollView(
      child: Container(
         margin: EdgeInsets.only(top: 50,left: 20,right: 20),
                padding: EdgeInsets.only(left:20,right: 20),
      child:Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Image.asset("assets/login.png" ),
         Center(child: Text("SignUp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
          Text("Please Enter the details below\n                    continue",style: TextStyle(fontSize: 20,color: Colors.black54),),
        SizedBox(height: 40,),
        TextFormField(
                                  controller: namecontroller,
                                  validator: (value){
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter the name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(hintText: 'Name',hintStyle:TextStyle(fontWeight: FontWeight.normal),prefixIcon: Icon(Icons.person)),
                                ),
                                SizedBox(height: 40,),
               TextFormField(
                                  controller: mailcontroller,
                                  validator: (value){
                                    if(value == null ||  value.isEmpty){
                                      return 'Please enter the email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(hintText: 'Email',hintStyle:TextStyle(fontWeight: FontWeight.normal),prefixIcon: Icon(Icons.email_outlined)),
                                ),
                                SizedBox(height: 40,),
                                TextFormField(
                                  controller: passwordcontroller,
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return 'Please Enter the Password';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(hintText: 'Password',hintStyle:TextStyle(fontWeight: FontWeight.normal),prefixIcon: Icon(Icons.password_outlined),),
                                ),
                                 
                               
                                 SizedBox(height: 50,),
                                  GestureDetector(
                                    onTap: (){
                                      if(_formkey.currentState!.validate()){
                                        setState(() {
                                          name = namecontroller.text;
                                          email = mailcontroller.text;
                                          password = passwordcontroller.text;
                                        });
                                      }
                                      registration();
                                    },
                                    child: Center(
                                      child: Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 8),
                                          width: 200,
                                          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(20)),
                                          child: Center(child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontSize:18 ,fontFamily: 'Poppins',fontWeight: FontWeight.bold),)),
                                        ),
                                      ),
                                    ),
                                  ),
                                   SizedBox(height: 40,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>login()));
                        },
                        child: Text("Already have an account ? Login",style: TextStyle(color:
                                    Colors.green,fontSize: 20),))
        ]),
      ),
      
      ),
    ),
    );
  }
  }
