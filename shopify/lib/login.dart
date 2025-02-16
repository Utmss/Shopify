import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify/forget_pass.dart';
import 'package:shopify/pages/bottom_nav.dart';
import 'package:shopify/signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String  email = "",password = "";
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  userlogin()async{
try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  ScaffoldMessenger.of(context).showSnackBar((SnackBar(
  backgroundColor: Colors.orangeAccent,
  content: Text('LoginSuccessfully',style: TextStyle(fontSize: 20),))));
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomNav()));
}on FirebaseAuthException catch(e){
  if(e.code == 'user-not-found'){
    ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text('Not user dound that email',style: TextStyle(color: Colors.black,fontSize: 18),))));
  }else if(e.code == 'Wrong Password'){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter Correct Password',style: TextStyle(color: Colors.black,fontSize: 18),)));
  }
}
}
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body:   SingleChildScrollView(
      child: Container(
         margin: EdgeInsets.only(top: 50,left: 20,right: 20),
                padding: EdgeInsets.only(left:20,right: 20),
      child:Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Image.asset("assets/login.png" ),
         Center(child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
          Text("Please Enter the details below\n                    continue",style: TextStyle(fontSize: 20,color: Colors.black54),),
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
                                 SizedBox(height: 20,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPassword()));
                                  },
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text("Forget Password?",style: TextStyle(color:
                                    Colors.green,fontSize: 20),)),
                                ),
                                 SizedBox(height: 50,),
                                  GestureDetector(
                                    onTap: (){
                                      if(_formkey.currentState!.validate()){
                                        setState(() {
                                          email = mailcontroller.text;
                                          password = passwordcontroller.text;
                                        });
                                      }
                                      userlogin();
                                    },
                                    child: Center(
                                      child: Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 8),
                                          width: 200,
                                          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(20)),
                                          child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize:18 ,fontFamily: 'Poppins',fontWeight: FontWeight.bold),)),
                                        ),
                                      ),
                                    ),
                                  ),
                                   SizedBox(height: 70,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>singup()));
                        },
                        child: Text("Don't have an account ? Sign Up",style: TextStyle(color:
                                    Colors.green,fontSize: 20),))
        ]),
      ),
      
      ),
    ),
    );
  }
}