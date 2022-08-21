import 'package:flutter/material.dart';
import 'package:log_reg/signup.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                color: Colors.blue[100],
              ),

              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  //color: Colors.cyanAccent,
                  padding: EdgeInsets.all(30),
                  //alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text('Login',style: TextStyle(
                          fontSize: 40),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //Image.asset('images/moj1.jpg'),
                      CircleAvatar(
                          radius: 50,
                          foregroundImage:AssetImage('images/flutter.jpg')
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        validator: (value){
                          print('${value}');
                          if( value!.length<5){
                            return 'username must contain atleat 5 characters' ;
                          }
                          else{
                            return null;
                          }

                        },

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.people),
                          hintText: 'Enter Username',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),

                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        validator: (value){
                          print('${value}');
                          if(value!.length != 10){
                            return 'Number is not correct';
                          }
                          else{
                            return null;
                          }

                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'Number',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),

                        ),
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(
                        height: 200,
                      ),

                      ElevatedButton(
                        onPressed:(){
                          //print('on submit');
                          if(formKey.currentState!.validate()){
                            print(' your data is submitted' );
                          }
                          else
                          {
                            print('something is wrong');
                          }
                        },
                        child: Text('submit'),
                      ),
                    SizedBox(
                      height: 20,
                    ),

                      InkWell(
                        onTap: ()
                        {
                          //print('Signup page');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const signup()),
                          );
                        },
                        child: Text('Sign up?',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                              fontSize: 15
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

