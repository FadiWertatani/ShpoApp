import 'package:flutter/material.dart';

import '../../models/login_model.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 40.0,
  Color background = Colors.blue,
  required Function function,
  required String text,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      color: background,
      height: height,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validator,
  Function? onSubmit,
  Function? onChanged,
  required IconData prefix,
  IconData? suffix,
  required String label,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit!(),
      onChanged: onChanged!(),
      validator: validator(),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? Icon(
          Icons.remove_red_eye,
        )
            : null,
      ),
    );

UserData ifNull = UserData(
  id: 0,
  name: '',
  email: '',
  phone: '',
  image: '',
  points: 0,
  credit: 0,
  token: '',
);
