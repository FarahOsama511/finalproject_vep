import 'package:finalproject_vep/Api/Apiservice.dart';
import 'package:finalproject_vep/models/postsmodel.dart';
import 'package:finalproject_vep/widgets/postslist.dart';
import 'package:flutter/material.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({super.key});

  @override
  State<Postscreen> createState() => _PostscreenState();
}

Apiservice apiservice = Apiservice();
late Future<List<Postsmodel>> getAllposts;

class _PostscreenState extends State<Postscreen> {
  @override
  void initState() {
    super.initState();
    getAllposts = apiservice.getposts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 21, 32),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 21, 32),
        centerTitle: true,
        title: const Text(
          "Posts",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: FutureBuilder<List<Postsmodel>>(
          future: getAllposts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Falid to load posts'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No posts available'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Postsmodel postsmodel = snapshot.data![index];
                    return Postslist(postsmodel: postsmodel);
                  });
            }
          }),
    );
  }
}
