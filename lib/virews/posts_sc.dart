import 'package:flutter/material.dart';
import 'package:posts_app/core/api_services.dart';

class posts_sc extends StatelessWidget {
  const posts_sc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: Api_sevicees.getPosts(),
          builder: (context,snapshot){
        var posts = snapshot.data;
        if(snapshot.hasData){
          return ListView.separated(itemBuilder: (context ,index){
            return ListTile(
              title: Text(posts![index].title??'',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold
              ),
              ),
              subtitle: Text(posts[index].body ??'' ),
              leading: Text(posts[index].id.toString()??'',
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
              ),

            );
          },
              separatorBuilder: (context ,index){
            return Divider(
              thickness: 2,
              color: Colors.blueGrey,
            );
              },
              itemCount: 5);
        }else if (snapshot.hasError){
          return Text('Error');
        }else{
          return CircularProgressIndicator();
        }

          })
    );
  }
}
