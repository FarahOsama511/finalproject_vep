import 'package:finalproject_vep/models/postsmodel.dart';
import 'package:finalproject_vep/models/provider.dart';
import 'package:finalproject_vep/screens/DetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Postslist extends StatefulWidget {
  Postslist({super.key, required this.postsmodel});
  final Postsmodel postsmodel;

  @override
  State<Postslist> createState() => _PostslistState();
}

class _PostslistState extends State<Postslist> {
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),

                  blurRadius: 2, // The blur effect of the shadow
                  offset: Offset(0, 3),
                )
              ], borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                  title: Text(
                    widget.postsmodel.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    widget.postsmodel.body,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Provider.of<Providerdata>(context)
                      .Handlefav(widget.postsmodel.Id)),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailsScreen(
                  postid: widget.postsmodel.Id,
                );
              }));
            },
          )
        ],
      ),
    );
  }
}
