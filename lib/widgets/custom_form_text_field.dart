

// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
 
// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
   CustomFormTextField({super.key, this.hintText,this.onChanged,this.obscureText = false});

  Function(String)? onChanged ; 
  bool? obscureText  ; 

   String? hintText ; 
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if(data!.isEmpty){
          return "field is required";
        }
      } ,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText ,hintStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
