import 'package:Lab3Flutter/github_repos.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Repository repo;

  DetailScreen(this.repo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${repo.name}"),
      ),
      body: Center(
        child: Card(
          elevation: 8.0,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Column(
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontSize: 22),
                ),
                Text(repo.description),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stars: ${repo.stars.toString()}"),
                    Text("Forks: ${repo.forks.toString()}"),
                    Text(
                      "Commits on master: ${repo.commits.toString()}",
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Id: ${repo.id}"),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Owner: ${repo.owner}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
