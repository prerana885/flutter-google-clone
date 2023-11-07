import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:googleclone/Search_screen.dart';
import 'package:googleclone/colors.dart';
class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Padding(
        padding:const EdgeInsets.only(top: 25),
        child: Row(
          children: [
            Padding(
                padding:const EdgeInsets.only(left: 28,right:15,top: 4 ),
           child: Image.asset('lib/assets/imagegoogle/google-logo.png',
             height:30,width: 92, ),
            ),
            const SizedBox(width: 27,),
            Container(
              height: 44,
              width: size.width*0.45,
              decoration:BoxDecoration(
                color: searchColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: searchColor,
                )
              ) ,
              child:TextFormField(
                onFieldSubmitted: (query){
                  Navigator.of(context).push(
                   MaterialPageRoute(
                       builder:(context)=>SearchScreen(start: '0',
                           searchQuery: query,
                       ),
                   ),
                  );
                },
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('lib/assets/imagegoogle/mic-icon(1).svg'),
                          const SizedBox(width: 20),
                            const Icon(Icons.search,color: blueColor,),

                        ],
                      ),
                    ),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ) ,
            ),
          ],
        ),
    );
  }
}
