import 'package:Lab3Flutter/github_ql_schemas.dart';
import 'package:Lab3Flutter/personal_graphql_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'detail_screen.dart';
import 'filter_widget.dart';
import 'github_repos.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final HttpLink httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async =>
        'Bearer ${PersonalGraphqlSettings.YOUR_PERSONAL_ACCESS_TOKEN}',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );
  runApp(Home(client));
}

class Home extends StatelessWidget {
  var client;

  Home(this.client);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyApp(client),
    );
  }
}

class MyApp extends StatefulWidget {
  var client;

  MyApp(this.client);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String language;
  String sorting;

  _openFilterView(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Filter(_updateFilter),
    );
  }

  _updateFilter(String language, String sorting) {
    setState(() {
      this.language = language;
      this.sorting = sorting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: widget.client,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openFilterView(context),
          child: Icon(Icons.sort),
        ),
        appBar: AppBar(title: Text("Lab3")),
        body: Container(
          child: Query(
            options: QueryOptions(
              documentNode: gql(GithubQLSchemas.GET_REPOSITORY(language)),
              // this is the query string you just created
              variables: {
                'nRepositories': 50,
              },
              pollInterval: 10,
            ),
            // Just like in apollo refetch() could be used to manually trigger a refetch
            // while fetchMore() can be used for pagination purpose
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.loading) {
                return Center(child: CircularProgressIndicator());
              }
              Repositories repositories =
                  Repositories.parse(result.data['search']['edges']);

              if (sorting == "Stars") {
                repositories.sortByStars();
              } else if (sorting == "Forks") {
                repositories.sortByForks();
              } else {
                repositories.sortByCommits();
              }

              return ListView.builder(
                itemCount: repositories.repos.length,
                itemBuilder: (context, index) {
                  Repository repo = repositories.repos.elementAt(index);
                  return Card(
                    elevation: 8.0,
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0)),
                      child: ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(repo),
                          ),
                        ),
                        title: Text(repo.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Owner: ${repo.owner}"),
                            Text("Language: ${repo.language}"),
                            Text("Forks: ${repo.forks}"),
                            Text("Commits: ${repo.commits}"),
                            Text("Stars: ${repo.stars}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
