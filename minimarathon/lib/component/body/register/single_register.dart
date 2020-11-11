import 'package:flutter/material.dart';
import 'package:minimarathon/component/body/register/result_register.dart';
import 'package:minimarathon/util/palette.dart';
//component
import '../../header/header.dart';

class SingleRegister extends StatefulWidget {
  final title;

  SingleRegister({this.title});

  @override
  _SingleRegisterState createState() => _SingleRegisterState();
}

class _SingleRegisterState extends State<SingleRegister> {
  FocusNode focusName = FocusNode();
  FocusNode focusPhoneNumber = FocusNode();
  FocusNode focusFee = FocusNode();

  final _formKey = GlobalKey<FormState>(); //form

  Map<String, dynamic> singleRegisterData = {
    "name": "",
    "phoneNumber": "",
    "donationFee": 10
  };

  bool isRegisterAvailable = false;

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      title: widget.title,
      body: registerBody(),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget registerBody() {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: white,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  // ---------------------------------------------------------------------------NAME
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Name",
                            style: TextStyle(
                                color: darkgrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: lightgrey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: lightgrey)),
                                labelText: 'input Name ...',
                                labelStyle: TextStyle(
                                    color: lightgrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              onChanged: (name) {
                                setState(() {
                                  singleRegisterData['name'] = name;
                                });
                              },
                              textInputAction: TextInputAction.next,
                              focusNode: focusName,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(focusPhoneNumber),
                              cursorWidth: 4.0,
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  // ---------------------------------------------------------------------------Phone Number
                  flex: 2,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                  color: darkgrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: lightgrey)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: lightgrey)),
                                  labelText: 'input Phone Number ...',
                                  labelStyle: TextStyle(
                                      color: lightgrey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    singleRegisterData['phoneNumber'] = text;
                                  });
                                },
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                focusNode: focusPhoneNumber,
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(focusFee),
                                cursorWidth: 4.0,
                              ))
                        ],
                      )),
                ),
                Expanded(
                  // ---------------------------------------------------------------------------Donation Fee
                  flex: 2,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Donation Fee",
                              style: TextStyle(
                                  color: darkgrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: lightgrey)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: lightgrey)),
                                  labelText: '\$10',
                                  labelStyle: TextStyle(
                                      color: lightgrey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    singleRegisterData['donationFee'] =
                                        int.parse(value);
                                  });
                                },
                                textInputAction: TextInputAction.done,
                                focusNode: focusFee,
                                keyboardType: TextInputType.number,
                                cursorWidth: 4.0,
                              )),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              !isRegisterAvailable
                                  ? "You can donate from \$10."
                                  : "You have successfully completed your donation!",
                              style: TextStyle(
                                  color: !isRegisterAvailable
                                      ? darkgrey
                                      : Colors.blue[400],
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                      // child: Text(singleRegisterData.toString() +  // for debugging
                      //     ' ' +
                      //     (singleRegisterData['donationFee'] is int).toString()),
                      ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: FlatButton(
                          onPressed: () {
                            if (singleRegisterData['donationFee'] >= 10 &&
                                singleRegisterData['name'] != '' &&
                                singleRegisterData['phoneNumber'] != '') {
                              setState(() {
                                isRegisterAvailable = true;
                              });
                            } else {
                              setState(() {
                                isRegisterAvailable = false;
                              });
                            }
                            if (isRegisterAvailable) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: orange, width: 3.0)),
                          child: Container(
                            width: double.infinity,
                            // height: MediaQuery.of(context).size.width * 0.2,
                            alignment: Alignment.center,
                            child: Text(
                              !isRegisterAvailable
                                  ? 'Pay by PAYPAL'
                                  : 'REGISTER',
                              style: TextStyle(
                                  color: orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0),
                            ),
                          ))),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        )));
  }
}