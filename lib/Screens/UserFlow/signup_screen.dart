import 'package:anand_mart/routers/routers.dart';
import 'package:anand_mart/widget/appassets.dart';
import 'package:anand_mart/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/apptheme.dart';
import '../../widget/common_text_field.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final formSignup = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText1 = true;
  var obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formSignup,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*.06,),
                Center(child: SvgPicture.asset(AppAssets.anand,height:130,width: size.width,)),
                SizedBox(height: size.height*.04,),
                Center(
                  child: Text("Create Account",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: AppTheme.secondaryColor,
                      // fontStyle: FontStyle.italic,
                    ),),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text("Create A New Account",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color:Color(0xFF33354B),
                      // fontStyle: FontStyle.italic,
                    ),),
                ),
                SizedBox(height: size.height*.03,),
                Text("Name",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color:Color(0xFF000000),
                    // fontStyle: FontStyle.italic,
                  ),),
                SizedBox(height: 7,),
                RegisterTextFieldWidget(
                  validator: MultiValidator([
                  RequiredValidator(
                  errorText:
                  'Please enter your name '),]),
                  hint: "Enter Name",
                ),
                SizedBox(height: 12,),
                Text("Email",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color:Color(0xFF000000),
                    // fontStyle: FontStyle.italic,
                  ),),
                SizedBox(height: 7,),
                RegisterTextFieldWidget(
                  validator: (value) {
                    if (emailController.text.isEmpty) {
                      return "Please enter your email";
                    } else if (emailController.text.contains('+') || emailController.text.contains(' ')) {
                      return "Email is invalid";
                    } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text)) {
                      return null;
                    } else {
                      return 'Please type a valid email address';
                    }
                  },
                  hint: "Enter Email",
                ),
                SizedBox(height: 12,),
                Text("Phone Number",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color:Color(0xFF000000),
                    // fontStyle: FontStyle.italic,
                  ),),
                SizedBox(height: 7,),
                RegisterTextFieldWidget(
                  keyboardType:
                  const TextInputType.numberWithOptions(
                      decimal: true),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12),
                    FilteringTextInputFormatter.allow(
                        RegExp('[0-9]+')),
                  ],
                  onChanged: (value) =>
                  doubleVar = double.parse(value),
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText:
                        'Please enter your contact number '),
                    MinLengthValidator(10,
                        errorText:
                        'Please enter minumum  10 digit number'),
                    MaxLengthValidator(12,
                        errorText:
                        'Please enter 12 digit number'),
                    PatternValidator(
                        r'(^(?:[+0]9)?[0-9]{10,12}$)',
                        errorText: '')
                  ]),
                  hint: "Enter Phone Number",
                ),
                SizedBox(height: 12,),
                Text("Password",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color:Color(0xFF000000),
                    // fontStyle: FontStyle.italic,
                  ),),
                SizedBox(height: 7,),
                RegisterTextFieldWidget(
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText: 'Please enter your password'),
                    MinLengthValidator(8,
                        errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                    PatternValidator(
                        r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                        errorText: "Password must be at least with 1 special character & 1 numerical"),
                  ]),

                  obscureText: obscureText2,
                  hint: "Enter Password",
                  suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText2 =
                          !obscureText2;
                        });
                      },
                      child: obscureText2
                          ? const Icon(
                        Icons.visibility_off,
                        color: Color(0xFF6A5454),
                      )
                          : const Icon(
                          Icons.visibility,
                          color: Color(
                              0xFF6A5454))),

                ),
                SizedBox(height: 12,),
                Text("Confirm Password",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color:Color(0xFF000000),
                    // fontStyle: FontStyle.italic,
                  ),),
                SizedBox(height: 7,),
                RegisterTextFieldWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Confirm password';
                    }
                    if (value.toString() ==
                        passwordController.text) {
                      return null;
                    }
                    return "Confirm password not matching with password";
                  },

                  obscureText: obscureText2,
                  hint: "Enter Confirm Password",
                  suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText2 =
                          !obscureText2;
                        });
                      },
                      child: obscureText2
                          ? const Icon(
                        Icons.visibility_off,
                        color: Color(0xFF6A5454),
                      )
                          : const Icon(
                          Icons.visibility,
                          color: Color(
                              0xFF6A5454))),

                ),

                SizedBox(height: size.height*.06,),
                CommonButtonGreen(title: "SIGN UP",onPressed: (){

                  if (formSignup.currentState!.validate()) {}
                },),


                SizedBox(height: size.height*.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF1C2550),
                        // fontStyle: FontStyle.italic,
                      ),),
                    InkWell(
                      onTap: (){
                        Get.toNamed(MyRouters.loginScreen);
                      },
                      child: Text(" Login",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppTheme.primaryColor,
                          // fontStyle: FontStyle.italic,
                        ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
