import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.buttonText, required this.onTap});

VoidCallback? onTap ; 

 String buttonText ; 
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
                width: double.infinity,
                height: 30,
                decoration:  BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                child:  Center(child: Text( buttonText ,style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ,)),
              ),
    ) ;
  }
}