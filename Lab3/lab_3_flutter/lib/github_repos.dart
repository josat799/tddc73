class Repositories {
  List<Repository> _repos = [];

  Repositories.parse(List object) {
    object.forEach((element) {
      Repository repo = Repository.parse(element['node']);
      _repos.add(repo);
    });
  }

  sortByStars() {
    _repos.sort((a, b) => b.stars.compareTo(a.stars));
  }

  sortByForks() {
    _repos.sort((a, b) => b.forks.compareTo(a.forks));
  }

  sortByCommits() {
    _repos.sort((a, b) => b.commits.compareTo(a.commits));
  }

  reverse() {
    _repos = _repos.reversed;
  }

  List<Repository> get repos => _repos;
}

class Repository {
  String _id, _name, _owner, _description, _language;
  int _forks, _commits, _stars;

  Repository();

  Repository.parse(Map object) {
    _id = object['id'] == null ? "Missing" : object['id'];
    _name = object['name'] == null ? "Missing" : object['name'];
    _owner =
        object['owner']['login'] == null ? "Missing" : object['owner']['login'];
    _forks = object['forks'] == null ? 0 : object['forks']['totalCount'];
    _stars =
        object['stargazers'] == null ? 0 : object['stargazers']['totalCount'];
    _commits = object['object'] == null
        ? 0
        : object['object']['history']['totalCount'];
    _description =
        object['description'] == null ? "Missing" : object['description'];
    _language = object['primaryLanguage'] == null
        ? "Missing"
        : object['primaryLanguage']['name'];
  }

  get language => _language;

  get description => _description;

  get stars => _stars;

  get commits => _commits;

  get forks => _forks;

  get owner => _owner;

  get name => _name;

  String get id => _id;

  @override
  String toString() {
    return 'Repository{_id: $_id, _name: $_name, _owner: $_owner, _forks: $_forks, _commits: $_commits, _stars: $_stars}';
  }
}


