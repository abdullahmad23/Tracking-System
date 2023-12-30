import 'package:flutter/material.dart';

const MaterialColor colors = MaterialColor(
  0xff00ABE7,
  <int, Color>{
    50: Color(0xff00ABE7),
    100: Color(0xff00ABa8),
    200: Color(0x7f00ABe7),
    300: Color(0x5f00ABE7),
    400: Color(0x2f00ABE7),
    500: Color(0xff00ABE7),
    600: Color(0xff00ABE7),
    700: Color(0xff00ABE7),
    800: Color(0xff00ABE7),
  },
);
const kcolor = Color(0x7f00ABE7);

class kbutton extends StatelessWidget {
  final Rpage;
  final BText;
  final CHeight;
  final CWidth;
  const kbutton({
    super.key,
    required this.Rpage,
    required this.BText,
    required this.CHeight,
    required this.CWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CHeight,
      width: CWidth,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Rpage),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kcolor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: Text(
          BText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// Reuseable Textfeild
class RoundedInputField extends StatelessWidget {
  final String hintText;
  // final ValueChanged<String> onChanged;
  // final TextEditingController controller;
  // final FormFieldValidator validate;
  final picons;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    // required this.onChanged,
    // required this.controller,
    // required this.validate,
    required this.picons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 330,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(50),
      //   border: BorderSide()
      // ),
      child: TextFormField(
        // onChanged: onChanged,
        controller: TextEditingController(),
        // validator: validate,
        decoration: InputDecoration(
          suffixIcon: Icon(picons),
          suffixIconColor: Colors.black,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}

class Consttext extends StatelessWidget {
  final kfontw;
  final kfonts;
  final kcolor;
  final String ctext;
  const Consttext({
    super.key,
    required this.ctext,
    required this.kfontw,
    required this.kfonts,
    required this.kcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      ctext,
      style: TextStyle(
        color: kcolor,
        fontSize: kfonts,
        fontWeight: kfontw,
      ),
    );
  }
}
