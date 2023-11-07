import 'package:flutter/material.dart';

import 'search_button.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const [
        SearchButton(title:'Google Search'),
            SizedBox(width: 10),
            SearchButton(title: "I\'m feeling lucky ")
          ],

        )
      ],
    );
  }
}
