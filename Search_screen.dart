import 'package:flutter/material.dart';
import 'package:googleclone/api_service.dart';
import 'package:googleclone/colors.dart';
import 'Search-result-component.dart';
import 'SearchHeader.dart';
import 'Search_Footer.dart';
import 'Search_tabs.dart';
import 'api_json.dart';
class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key,
    required this.start,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Title(
      color:Colors.blue ,
      title: searchQuery,
      child: Scaffold(
       body: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             //web header
             const SearchHeader(),
             //tabs for images
               Padding(
               padding:  EdgeInsets.only(
                   left:size.width<=768?10: 150.0),
               child:const  SingleChildScrollView(
                   scrollDirection:Axis.horizontal,
                 child:  SearchTabs()),
             ),
             const Divider(
               height: 0,
               thickness: 0.3,
             ),
             FutureBuilder(
               future: ApiService().fetchData(queryTerm: searchQuery,start: start),
                 builder:(BuildContext context,AsyncSnapshot snapshot){
                 if(snapshot.hasData){
                   return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         padding:EdgeInsets.only(
                           left:size.width<=768?10: 150.0,top: 12,) ,
                         child: Text(
                         "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                         style: const TextStyle(
                           fontSize: 15,
                           color: Color(0xff70757a),
                         ),
                         ),
                       ),
                       ListView.builder(
                         itemCount:snapshot.data?['items'].length,
                         shrinkWrap:true,
                         itemBuilder:(context,index){
                             return Padding(
                               padding:
                               EdgeInsets.only(left:size.width<=768?10: 150.0 ,top: 10),
                               child: SearchResultComponents(
                                 desc: snapshot.data?['items'][index]["snippet"],
                                 linkToGo: snapshot.data?['items'][index]
                                 ["link"],
                                 link: snapshot.data?['items'][index]
                                 ["formattedUrl"],
                                 text: snapshot.data?['items'][index]["title"],

                               ),
                             );
                           },
                       )
                     ],
                   );
                 }
                 return const Center(
                   child: CircularProgressIndicator(),
                 );
                 }
             ),

             //search results

             //buttons
             SizedBox(
               width:double.infinity ,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   TextButton(onPressed: (){
                    if(start!="0"){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=>SearchScreen(start: (int.parse(start)-10).toString(),
                           searchQuery: searchQuery)));
                    }
                   },
                       child: const Text('<Prev',style: TextStyle(
                         fontSize: 15,
                         color: blueColor,
                       ),
                       ),
                   ),
                   const SizedBox(width: 30,),
                   TextButton(onPressed: (){

                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>SearchScreen(start: (int.parse(start)+10).toString(),
                        searchQuery: searchQuery)));

                   },
                     child: const Text('Next >',style: TextStyle(
                       fontSize: 15,
                       color: blueColor,
                     ),
                     ),
                   ),
              //  const SizedBox(height: 30,),
                //   const SearchFooter(),
                 ],
               ),
             ),
             const SizedBox(height: 30,),
               const SearchFooter(),
           ],
         ),
       ),
      ),
    );
  }
}
