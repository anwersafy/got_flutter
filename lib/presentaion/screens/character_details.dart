import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharactersModel characterdata;
  const CharacterDetailsScreen({super.key, required this.characterdata});
  Widget buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.grey,
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(characterdata.fullName,style: TextStyle(
          color: Colors.white
        ),),
        background: Hero(
          tag: characterdata.id,
          child: Image.network(
            characterdata.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  Widget CharacterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,

      text: TextSpan(
      children: [
        TextSpan(
          text: '$title: ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ]
    ),
    );
  }
  Widget BuildDivider(double endIndent, double indent ) {
    return Divider(
      color: Colors.orange,
      thickness: 5,
      height: 20,
      endIndent: endIndent,
      indent: indent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
             Container(
               margin: EdgeInsets.all(10),
               padding: EdgeInsets.all(10),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   SizedBox(height: 40,),
                   CharacterInfo(
                      'Title',
                      characterdata.title,

                   ),
                   BuildDivider(
                      70,
                      70,
                    ),
                    CharacterInfo(
                        'Family',
                        characterdata.family,
                    ),
                    BuildDivider(
                      60,
                      60,
                    ),





                 ],
               ),
             ),
              SizedBox(height: 700,)
            ]
          ),
            
          )

        ],
      ),

    );
  }
}
