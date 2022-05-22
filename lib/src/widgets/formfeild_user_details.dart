import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class FormFeildUserDetails extends StatefulWidget {
  final String hintText;
  final bool readOnly;
  final Function onPressed;
  final bool isPhoneNumber;
  final IconData icon;
  final bool isColorWhite;
  final bool IconColor;
  final TextEditingController textEditingController;
  final bool capitalize;
  FormFeildUserDetails(
      {this.hintText = "Please fill the form",
      this.textEditingController,
      this.icon,
      this.IconColor = true,
      this.isColorWhite = false,
      this.isPhoneNumber = false,
      this.capitalize = false,
      this.onPressed,
      this.readOnly = true});
  @override
  _FormFeildUserDetailsState createState() => _FormFeildUserDetailsState();
}

class _FormFeildUserDetailsState extends State<FormFeildUserDetails> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        widget.onPressed();
      },
      textCapitalization: widget.capitalize == true
          ? TextCapitalization.characters
          : TextCapitalization.sentences,

      controller: widget.textEditingController,
      cursorColor: widget.isColorWhite != true
          ? Constants.kitGradients[2].withOpacity(0.2)
          : Constants.kitGradients[0],
      keyboardType:
          widget.isPhoneNumber ? TextInputType.number : TextInputType.text,

      obscureText: false,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: widget.isColorWhite != true
            ? Constants.kitGradients[4]
            : Constants.kitGradients[0],
        fontFamily: "Prompt-Light",
      ),
      //readOnly: widget.readOnly,

      decoration: InputDecoration(
        //errorText: widget.errorText,
        prefixIcon: Icon(
          widget.icon,
          size: 24,
          color: widget.isColorWhite != true
              ? Constants.kitGradients[2]
              : Constants.kitGradients[0],
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 50),
            vertical: screenHeight(context, dividedBy: 120)),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: widget.isColorWhite != true
              ? Constants.kitGradients[3]
              : Constants.kitGradients[0],
          fontFamily: "Prompt-Light",
        ),
        fillColor: widget.isColorWhite != true
            ? Constants.kitGradients[2].withOpacity(0.1)
            : Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.isColorWhite != true
                  ? Constants.kitGradients[2].withOpacity(0.5)
                  : Constants.kitGradients[0],
              width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.isColorWhite != true
                  ? Constants.kitGradients[2].withOpacity(0.5)
                  : Constants.kitGradients[0],
              width: 1),
        ),
      ),
    );
  }
}
