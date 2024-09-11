import 'package:finalproject_vep/Api/Apiservice.dart';
import 'package:finalproject_vep/models/commentsmodel.dart';
import 'package:finalproject_vep/models/postsmodel.dart';
import 'package:finalproject_vep/models/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final int postid; //postid==id
  DetailsScreen({super.key, required this.postid});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

late Future<Map<String, dynamic>> getPostandcomments;

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    getPostandcomments = fetchpostandcomments(widget.postid);
  }

  Future<Map<String, dynamic>> fetchpostandcomments(int postid) async {
    final post = Apiservice().getpost(postid);
    final comments = Apiservice().getComments(postid);
    final result = await Future.wait([post, comments]);
    return {"post": result[0], "Comments": result[1]};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Provider.of<Providerdata>(context).Handlefav(widget.postid))
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: getPostandcomments,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Falid to load Data'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Data available'),
              );
            } else {
              Postsmodel post = snapshot.data!['post'];
              List<Commentsmodel> comment = snapshot.data!["Comments"];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: ListTile(
                        title: Text(
                          post.title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(post.body),
                      ),
                    ),
                    const Divider(),
                    const Text(
                      textAlign: TextAlign.start,
                      "Comments",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(
                                color: Colors.grey.shade200,
                              ),
                          itemCount: comment.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.grey)]),
                              child: ListTile(
                                title: Text(
                                  comment[index].name,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                                subtitle: Text(comment[index].body),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
