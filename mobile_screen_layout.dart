import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:googleclone/web_footer.dart';
import 'package:googleclone/websearch-button.dart';
import 'Mobile-Footer.dart';
import 'Search.dart';
import 'TranslationButton.dart';
import 'colors.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leading:IconButton(icon: const Icon(Icons.menu,color: Colors.grey,),
          onPressed: (){},
          ) ,
          title:SizedBox(
            width: size.width*0.34,
            child: const DefaultTabController(length: 2,
              child:TabBar(
                labelColor: blueColor,
              unselectedLabelColor:Colors.grey ,
              indicatorColor: blueColor,
              tabs:[Tab(text:'ALL'),
                Tab(text: 'Images',),
            ],

            ),
            ),
          ) ,
          actions: [
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
                        //SearchButtons(),
                        //SizedBox(
                          //height: 20,
                        //),
                        //TranslationButtons(),
                      ],
                    ),
                    const MobileFooter(),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
