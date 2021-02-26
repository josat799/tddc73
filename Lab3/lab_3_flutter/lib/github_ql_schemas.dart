class GithubQLSchemas {
  static String GET_REPOSITORY(String language) {
    var languageQ = language == 'All' ? '' : ' language:$language';

    return """
  {
  search(query: "is:public stars:>0$languageQ", type: REPOSITORY, first:20) {
    repositoryCount
    edges {
      node {
        ... on Repository {
          id
          name
          description
          owner {
              login
            }
          stargazers {
            totalCount
          }
          primaryLanguage {
              name
           }
           forks {
           totalCount
          }  
          object(expression: "master") {
              ... on Commit {
                history {
                  totalCount
                }
              }
            }         
        }
      }
    }
  }
  }
""";
  }
}
