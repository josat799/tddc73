import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  var language;
  var sortType;

  Function updateFilter;


  Filter(this.updateFilter);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  hintText: "Programming Language",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              items: languages
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {language = val;}),
          DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: "Sort By",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              items: sortingSettings
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {sortType = val;}),
          Container(
            width: double.infinity,
            child: RaisedButton(
              elevation: 8.0,
              onPressed: () {updateFilter(language, sortType);},
              child: Text("Update"),
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}

const List<String> languages = [
  "All",
  "Python",
  "JavaScript",
  "TypeScript",
  "Java",
  "C",
  "C++",
  "CSharp",
];

const List<String> sortingSettings = [
  "Commits",
  "Stars",
  "Forks",
];
