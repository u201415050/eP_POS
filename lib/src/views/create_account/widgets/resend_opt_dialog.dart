import 'package:epaisa_pos/src/utility/colors.dart';
import 'package:epaisa_pos/src/utility/multilanguage.dart';
import 'package:epaisa_pos/src/utility/screen_utils.dart';
import 'package:epaisa_pos/src/utility/tablet.dart';
import 'package:epaisa_pos/src/views/reset_password/widgets/otp_fields.dart';
import 'package:epaisa_pos/src/views/reset_password/widgets/timer.dart';
import 'package:epaisa_pos/src/widgets/buttons/button_gradient2.dart';
import 'package:epaisa_pos/src/widgets/textfields/texfield_number.dart';
import 'package:epaisa_pos/src/widgets/textfields/textfield_classic.dart';
import 'package:epaisa_pos/src/widgets/textfields/textfield_password.dart';
import 'package:flutter/material.dart';

class ResendOTPDialog extends StatefulWidget {
  ResendOTPDialog({Key key, this.action}) : super(key: key);
  final Function action;
  @override
  ResendOTPDialogState createState() => ResendOTPDialogState();
}

class ResendOTPDialogState extends State<ResendOTPDialog> {
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
            "Please ensure the Mobile",
            style: TextStyle(
                color: AppColors.DarkGray,
                fontSize: tablet ? hp(2.6) : hp(2.2),
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Number entered is correct",
            style: TextStyle(
                color: AppColors.DarkGray,
                fontSize: tablet ? hp(2.6) : hp(2.2),
                fontWeight: FontWeight.w600),
          ),
        ],
      );
    }

    List<Widget> _timeResend() {
      return [
        TextfieldNumber(
          labelText: eptxt('mobile_number'),
          fontSize: tablet ? hp(2.7) : hp(2.1),
          paddingBottomInput: tablet ? hp(1.5) : hp(1.2),
        ),
        SizedBox(
          height: tablet ? hp(5) : hp(4),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: tablet ? wp(4.5) : wp(10)),
          child: ButtonGradient(
            borderRadius: hp(3),
            callback: () {
              closeModal();
              widget.action();
            },
            fontSize: tablet ? hp(2.2) : hp(1.8),
            paddingVertical: tablet ? hp(2) : hp(1.8),
            title: eptxt('resend_otp').toUpperCase(),
          ),
        ),
        SizedBox(
          height: hp(3),
        ),
      ];
    }

    Widget content() {
      return Container(
        width: (tablet ? wp(37) : wp(85)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, hp(1), hp(1), hp(1)),
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showModal = false;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      "assets/general_icons/xbutton.png",
                      height: tablet ? hp(2.5) : hp(2.2),
                    )),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: tablet ? wp(4) : wp(8)),
                child: Column(
                  children: <Widget>[
                    _titleNumber(),
                    SizedBox(
                      height: tablet ? hp(4) : hp(3.5),
                    ),
                    ..._timeResend(),
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
                        width: (tablet ? wp(37) : wp(85)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(),
                            ),
                            Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      tablet ? wp(1) : wp(2)),
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
