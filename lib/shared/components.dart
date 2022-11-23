import 'package:flutter/material.dart';

Widget buildNewsArticle(){
  return Container(
    color: Colors.brown[200],
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('https://media.wired.com/photos/5b899992404e112d2df1e94e/master/pass/trash2-01.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child:Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'titleasdddddddfghjkjjkjl;kjlk''hjsahjsadhkjdhaksdhakdhasldhhhhhdsasaksdajskdhakdghhcvjvhnbmnbmbvnvmj,hbm b ,nv,.mn,hjbbjhbjlhlhbjdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text('date'),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myDivider(){
  return Container(
    width: double.infinity,
    height: 2,
    color: Colors.brown[300],
  );
}