
import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  String msg = ' ';
 bool isHidden = true ;
    final formKey = GlobalKey<FormState>();

  @override
  /*void initState()
  {
    _passwordvisible = false;
  }*/
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                color: Colors.amber[100],
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text('SignUp Form', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,

                      ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length < 3) {
                              return 'Name must be of min 3 characters';
                            }
                            else {
                              return null;
                            }
                          },
                          maxLength: 3,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          decoration:
                          InputDecoration(
                              hintText: 'Enter First Name',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            prefixIcon: Icon(Icons.people),
                          ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length != 10) {
                              return 'Phone number should contain 10 digits';
                            }
                            else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration:
                          InputDecoration(
                              hintText: 'Enter Phone Number',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            prefixIcon: Icon(Icons.phone),
                          ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                        InputDecoration(
                            hintText: 'Enter Email Id',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: Icon(Icons.email),
                        ),
                       keyboardType: TextInputType.emailAddress,
                      validator: (value)
                        {
                          if(value==null || value.isEmpty)
                            {
                              return'enter your mail ID';
                            }
                          if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                          {
                                  return "please enter valid email ID";
                          }
                          return null;
                        },
                      /*  onChanged: (val) {
                          validateEmail(val);
                          //print('${val}');
                        },*/
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value)
                        {
                          if(value == null || value.isEmpty)
                            {
                              return  "password must be between 6 to 16 characters";
                            }
                          else if (value.length<6 )
                            {
                              return  "password must be between 6 to 16 characters";
                            }
                          else if (value.length>16 )
                          {
                            return  "password must be between 6 to 16 characters";
                          }
                          else
                            {
                              return null;
                            }
                        },
                         obscureText:true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'enter password',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon:
                            isHidden  ? Icon(Icons.visibility_off): Icon(Icons.visibility),
                            onPressed: togglePasswordVisisbility,
                        ),
                      ),
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      /*TextFormField(
                        validator: (value) {
                           if(value!.length  < 6 && value.length>16)
                          {
                            return 'password length must be between 6 to 16 characters only';
                          }
                          else
                          {
                            return null;
                          }
                        },

                        //keyboardType: TextInputType.text,
                        //obscureText: isHidden ,
                          decoration:
                          InputDecoration(
                              hintText: 'Enter your Password',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon:
                                        isHidden  ? Icon(Icons.visibility_off): Icon(Icons.visibility),
                              onPressed: togglePasswordVisisbility,
                            ),
                          ),
                        ),*/


                      SizedBox(
                        height: 200,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('your data is submitted correctly');
                          }
                          else {
                            print('enter appropriate data');
                          }
                        },
                        child: Text('Submit Data'),
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
  void togglePasswordVisisbility() =>setState(() =>isHidden = !isHidden);
  /*void validateEmail(String val) {
    print('hii');
    if (val.isEmpty) {
      setState(() {
        msg = "email cannot be empty";
      });
    }
    else if(!EmailValidator.validate(val,true))
      {
        setState(() {
          msg = "Enter Valid Email Address";
        });
      }
    else
      {
        setState(() {
          msg= "  ";
        });
      }
  }*/
}
