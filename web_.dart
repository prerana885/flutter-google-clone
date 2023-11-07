import 'package:flutter/material.dart';
import 'package:googleclone/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:googleclone/web_footer.dart';

import 'Search.dart';
import 'TranslationButton.dart';
import 'search_button.dart';
import 'websearch-button.dart';
class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){},
            child: const Text('Gmail',style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w400,
          ),
          ),
          ),
          TextButton(onPressed: (){},
            child: const Text('Images',style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w400,
            ),
            ),
          ),
          const SizedBox(width: 10,),
          IconButton(
              onPressed: (){},
              icon: SvgPicture.asset('lib/assets/imagegoogle/more-apps.svg',color: primaryColor,)
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0).copyWith(
              right: 10,
            ),
            child: MaterialButton(
              onPressed:(){},
              height:20 ,
              color:const Color(0xff1A73EB) ,
            child: const Text(
              'Sign in',
              style: TextStyle(color: Colors.white70,
              ),),
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left:5,right: 5 ),
      child: Column(
        children: [
          SizedBox(height:size.height*0.25 ),
           Expanded(
               child:Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     children: const [
                       Search(),
                        SizedBox(
                         height: 20,
                       ),
                       SearchButtons(),
                        SizedBox(
                         height: 20,
                       ),
                       TranslationButtons(),
                     ],
                   ),
                   const WebFooter(),
                 ],
               ),
           )
        ],
      ),
      )
    );
  }
}