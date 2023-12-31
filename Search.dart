import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:googleclone/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/src/material/page.dart';

import 'Search_screen.dart';
class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 final size=MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('lib/assets/imagegoogle/google-logo.png',height:size.height*0.12 ,),
        ),
      const SizedBox(height: 20,),
        SizedBox(
          width: size.width>768 ?size.width*0.4:size.width*0.9,
          child: TextField(
            onSubmitted:(val){
              if(val!=""){
               Navigator.of(context).push(
                   MaterialPageRoute(
                 builder: (context)=>SearchScreen(
             searchQuery:val.trim(),
             start: '0',

    ),
    ),
    );
    }
    },       decoration:  InputDecoration(
              border: const OutlineInputBorder(
         borderRadius:BorderRadius.all(Radius.circular(30,),
    ),
            ),
            prefixIcon:Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('lib/assets/imagegoogle/search-icon.svg',
                color: searchBorder,
                width: 1,
                height: 1,
              ),
            ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                    'lib/assets/imagegoogle/mic-icon(1).svg',
                ),
              ),
            )
            ),
        ),
        const SizedBox(
          height: 20,
        ),

      ],
    );
  }
}
