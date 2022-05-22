import 'package:app_template/src/screens/home_page.dart';
import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:app_template/src/widgets/formfeild_user_details.dart';
import 'package:app_template/src/widgets/gradeint_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameTextEditingController =
  new TextEditingController();
  TextEditingController passwordTextEditingController =
  new TextEditingController();

  static const snackBar = SnackBar(
    content: Text('Invalid Credentials'),
  );


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[4],
      resizeToAvoidBottomInset: false,

      body: ListView(
        children: [
          Container(
            height: screenHeight(context, dividedBy: 1),
            child: Stack(
              children: [
                Container(
                  width: screenWidth(context, dividedBy: 1),
                  height: screenHeight(context, dividedBy: 1),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Constants.kitGradients[5],
                        Constants.kitGradients[4],
                        Constants.kitGradients[4],
                      ])),
                  child: Column(
                    children: [

                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context, dividedBy: 4),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Constants.kitGradients[0],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight(context, dividedBy: 20),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: Constants.kitGradients[2]
                                        .withOpacity(0.2),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Constants.kitGradients[4],
                                    fontFamily: "Prompt-Light",
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: Constants.kitGradients[2]
                                        .withOpacity(0.2),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight(context, dividedBy: 15),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                  screenWidth(context, dividedBy: 10)),
                              child: Column(
                                children: [
                                  FormFeildUserDetails(
                                      isPhoneNumber: false,
                                      onPressed: () {},
                                      icon: Icons.person_outline,
                                      hintText: "Username",
                                      textEditingController:
                                      usernameTextEditingController),
                                  SizedBox(
                                    height:
                                    screenHeight(context, dividedBy: 20),
                                  ),
                                  FormFeildUserDetails(
                                      isPhoneNumber: false,
                                      onPressed: () {},
                                      icon: Icons.phone,
                                      hintText: "Password",
                                      textEditingController:
                                      passwordTextEditingController),
                                  SizedBox(
                                    height:
                                    screenHeight(context, dividedBy: 30),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight(context,
                                            dividedBy: 30)),
                                    child: Center(
                                      child: GradientButton(
                                        clearButton: false,
                                        isColorGreen: true,
                                        title: "SIGN UP",
                                        onPressed: () {
                                          if (usernameTextEditingController.text != "" || passwordTextEditingController.text != "") {
                                            if(usernameTextEditingController.text==passwordTextEditingController.text){

                                              Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => HomePage()));

                                            }else{
                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GradientButton(
                                        clearButton: true,

                                        title: "Clear",
                                        onPressed: () {
                                          passwordTextEditingController.clear();
                                          usernameTextEditingController.clear();
                                        },
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
