import 'package:epaisa_pos/src/utility/colors.dart';
import 'package:epaisa_pos/src/utility/multilanguage.dart';
import 'package:epaisa_pos/src/utility/remove_over_scroll_glow.dart';
import 'package:epaisa_pos/src/utility/screen_utils.dart';
import 'package:epaisa_pos/src/utility/tablet.dart';
import 'package:epaisa_pos/src/views/reset_password/widgets/otp_fields.dart';
import 'package:epaisa_pos/src/views/reset_password/widgets/timer.dart';
import 'package:epaisa_pos/src/widgets/buttons/button_gradient2.dart';
import 'package:epaisa_pos/src/widgets/textfields/texfield_number.dart';
import 'package:epaisa_pos/src/widgets/textfields/textfield_classic.dart';
import 'package:epaisa_pos/src/widgets/textfields/textfield_password.dart';
import 'package:epaisa_pos/src/widgets/texts/text_gray.dart';
import 'package:flutter/material.dart';

class AddCustomerHoldDialog extends StatefulWidget {
  AddCustomerHoldDialog({
    Key key,
  }) : super(key: key);

  @override
  AddCustomerHoldDialogState createState() => AddCustomerHoldDialogState();
}

class AddCustomerHoldDialogState extends State<AddCustomerHoldDialog> {
  bool showModal = true;
  bool resendDisabled = true;
  @override
  void initState() {
    super.initState();
  }

  void closeModal() {
    Navigator.of(context).pop();
    setState(() {
      showModal = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    var tablet = isTablet(MediaQuery.of(context));
    Widget _titleNumber() {
      return Column(
        children: <Widget>[
          Text(
            "We have sent an OTP to",
            style: TextStyle(
                color: AppColors.DarkGray,
                fontSize: tablet ? hp(2.8) : hp(2.2),
                fontWeight: FontWeight.w600),
          ),
          Text(
            "+91 98675 43210",
            style: TextStyle(
                color: AppColors.PrimaryBlue,
                fontSize: tablet ? hp(3) : hp(2.4),
                fontWeight: FontWeight.w700),
          )
        ],
      );
    }

    List<Widget> _timeResend() {
      return [
        OtpFields(),
        SizedBox(
          height: hp(3),
        ),
        TimerButton(
          seconds: 10,
          onStart: () {},
          onFinish: () {
            setState(() {
              resendDisabled = false;
            });
          },
        ),
        SizedBox(
          height: hp(3),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: tablet ? wp(4.5) : wp(10)),
          child: ButtonGradient(
            disabled: resendDisabled,
            borderRadius: hp(3),
            fontSize: tablet ? hp(2.2) : hp(1.8),
            paddingVertical: tablet ? hp(2) : hp(1.8),
            title: "RESEND OTP",
          ),
        )
      ];
    }

    List<Widget> _formReset() {
      return [
        SizedBox(
          height: tablet ? hp(3) : hp(2),
        ),
        Text(
          "Insert New Password",
          style: TextStyle(
              color: AppColors.DarkGray,
              fontSize: tablet ? hp(2.5) : hp(2.2),
              fontWeight: FontWeight.w700,
              letterSpacing: 0.1),
        ),
        SizedBox(
          height: tablet ? hp(0.5) : hp(1),
        ),
        TextfieldPassword(
          fontSize: tablet ? hp(2.4) : hp(2.01),
          paddingBottomInput: hp(1),
          labelText: "Password",
        ),
        SizedBox(
          height: tablet ? hp(0.2) : hp(0.5),
        ),
        TextfieldPassword(
          fontSize: tablet ? hp(2.4) : hp(2.01),
          paddingBottomInput: hp(1),
          labelText: "Re-type Password",
        ),
        SizedBox(
          height: hp(3),
        ),
        ButtonGradient(
          disabled: true,
          borderRadius: hp(3),
          fontSize: tablet ? hp(2.2) : hp(1.8),
          paddingVertical: tablet ? hp(2) : hp(1.8),
          title: "RESET PASSWORD",
        ),
        SizedBox(
          height: hp(3),
        ),
      ];
    }

    Widget content() {
      return Container(
        width: (tablet ? wp(42) : wp(85)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, hp(0.5), 0, hp(1)),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: tablet ? hp(1.5) : hp(1.3)),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.LightGray, width: 2.5))),
                      alignment: Alignment.center,
                      width: (tablet ? wp(42) : wp(85)),
                      child: Text(
                        eptxt('customer_information'),
                        style: TextStyle(
                            fontSize: tablet ? hp(2.2) : hp(2.2),
                            fontWeight: FontWeight.w700,
                            color: AppColors.DarkGray),
                      ),
                    ),
                    Positioned(
                        top: tablet ? hp(1.5) : hp(1.3),
                        right: hp(1.5),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showModal = false;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/general_icons/xbutton.png",
                              height: tablet ? hp(2) : hp(2.2),
                            ))),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: tablet ? wp(4) : wp(8)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: tablet ? hp(1) : hp(0.5),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: TextfieldClassic(
                          paddingBottomInput: tablet ? hp(1.5) : hp(1.2),
                          fontSize: tablet ? hp(2.7) : hp(2.1),
                          labelText: "First Name",
                        )),
                        Expanded(
                            child: TextfieldClassic(
                          leftBorder: true,
                          paddingBottomInput: tablet ? hp(1.5) : hp(1.2),
                          fontSize: tablet ? hp(2.7) : hp(2.1),
                          labelText: "Last Name",
                        )),
                      ],
                    ),
                    SizedBox(
                      height: tablet ? hp(4) : hp(3),
                    ),
                    TextfieldNumber(
                      alwaysFocus: true,
                      fontSize: tablet ? hp(2.7) : hp(2.1),
                      paddingBottomInput: tablet ? hp(1.5) : hp(1.2),
                    ),
                    SizedBox(
                      height: tablet ? hp(4) : hp(3),
                    ),
                    GestureDetector(
                      onTap: () {
                        closeModal();
                      },
                      child: ButtonGradient(
                        title: multilang.get('save').toUpperCase(),
                        fontSize: tablet ? hp(2.3) : hp(1.8),
                        paddingVertical: tablet ? hp(2.3) : hp(1.8),
                        borderRadius: hp(2.3),
                      ),
                    ),
                    SizedBox(
                      height: tablet ? hp(4) : hp(2.7),
                    ),
                  ],
                ),
              ),
            ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: Container(
        alignment: Alignment.center,
        width: wp(100),
        height: hp(100),
        child: !showModal
            ? Container()
            : Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showModal = false;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: wp(100),
                      height: hp(100),
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        width: (tablet ? wp(42) : wp(85)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(),
                            ),
                            Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      tablet ? wp(1) : wp(3)),
                                  color: AppColors.PrimaryWhite,
                                ),
                                child: content()),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
