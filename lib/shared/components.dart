import 'package:flutter/material.dart';
import 'package:flutter_news_app/modules/web_view/web_screen.dart';

Widget buildNewsArticle(article,context){
  return InkWell(
    onTap: (){
      navigateTo(context, WebViewScreen(article['url']));
    },
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
                image: NetworkImage('${article['urlToImage']}'),
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
                      '${article['title']}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[800],
                      ),
                    ),
                  ),
                  Text('${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  ),
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

Widget articleBuilder(list){
  return list.length==0
      ? Center(child: CircularProgressIndicator())
      : ListView.separated(
      physics:BouncingScrollPhysics(),
      itemBuilder: (context,index)=> buildNewsArticle(list[index],context),
      separatorBuilder: (context,index) => myDivider(),
      itemCount: list.length);
}


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit(value)?,
  Function? onChanged(value)?,
  required String? Function(String? value)? validate,
  required String label,
  Function? Function()? onTap,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  validator: validate,
  onTap: onTap,
  decoration: InputDecoration(
    label: Text(
      label
    ),
    border: InputBorder.none
  ),
  style: TextStyle(
    color: Colors.purple
  ),

);

void navigateTo(context,widget) => Navigator.push(context,
    MaterialPageRoute(builder: (context)=>widget)
);
