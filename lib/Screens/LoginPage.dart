import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ingorala_app/utils/DesignConfig.dart';
import 'package:ingorala_app/utils/strings.dart';
import 'package:ingorala_app/utils/theme_config.dart';
import 'package:octo_image/octo_image.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool acceptterms = false;
  bool isloading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController edtemail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(ThemeColor.appcolor.withOpacity(0.5), BlendMode.srcOver),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/background.jpg",
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(.2),
            )),
      ),
      Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                              child: Image.asset(
                            "assets/logo.jpeg",
                            height: 120,
                            width: 120,
                          )),
                          SizedBox(height: 20),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .merge(TextStyle(
                                      color: ThemeColor.yellow,
                                      fontWeight: FontWeight.bold)),
                              text: "Welcome To",
                              children: const <TextSpan>[
                                TextSpan(
                                    text: "\nઇંગોરાળા ( જાગાણી )\tગામ પરિવાર ",
                                    style: TextStyle(
                                        color: ThemeColor.yellow,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          // Text(
                          //   Strings.loginsigninlabel,
                          //   style: TextStyle(color: ThemeColor.white),
                          // ),
                          SizedBox(height: 30),
                          Text(Strings.labellogin,
                              style:
                                  Theme.of(context).textTheme.headline5!.merge(
                                        TextStyle(
                                            color: ThemeColor.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: ThemeColor.yellow,
                            height: 2,
                          ),
                          Container(
                            decoration:
                                DesignConfig.boxDecorationContainerBorder(
                                    ThemeColor.white, 10),
                            margin: EdgeInsets.only(top: 20),
                            padding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              // maxLength: 10,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              style: TextStyle(color: ThemeColor.white),
                              cursorColor: ThemeColor.primary,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: ThemeColor.white,
                                ),
                                hintText: "મોબાઈલ નંબર ",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(TextStyle(color: ThemeColor.white)),
                                border: InputBorder.none,
                                errorStyle: TextStyle(
                                  color: Colors.white
                                )
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                    if(value!.isEmpty)
                                      {
                                        return "Please enter Mobile Number";
                                      }
                                    else
                                      {
                                        return null;
                                      }
                              },
                              controller: edtemail,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Align(
                          //     alignment: Alignment.centerRight,
                          //     child: GestureDetector(
                          //       onTap: () {},
                          //       child: Text(
                          //         Strings.forgotpsw,
                          //         textAlign: TextAlign.end,
                          //         style: TextStyle(color: ThemeColor.white),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          if (isloading)
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new CircularProgressIndicator(),
                            )),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigator.of(context).pushReplacement(
                                //     CupertinoPageRoute(
                                //         builder: (context) =>
                                //             CategoryActivity()));
                              }
                            },
                            child: Container(
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 40),
                              padding: EdgeInsets.symmetric(vertical: 18),
                              child: Text(
                                Strings.labellogin,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .merge(TextStyle(
                                        color: ThemeColor.appcolor,
                                        fontWeight: FontWeight.bold)),
                              ),
                              decoration:
                                  DesignConfig.boxDecorationContainerColor(
                                      ThemeColor.white, 15),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            // bottomWidget(),
          ],
        ),
      ),
    ]);
  }

}
