import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_language_entity.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/domain/usecases/find_stats_language/find_stats_language.dart';
import 'package:github_commons/module/domain/usecases/find_stats_language/i_find_stats_language.dart';

void main() {
  late IFindStatsLanguage findStatsLanguage;

  const lstRepositoriesEntity = <GithubRepositoryEntity>[
    GithubRepositoryEntity(
      id: 1,
      nodeId: "abcdef:",
      name: "dart-project",
      fullName: "whosramoss/dart-project",
      htmlUrl: "https://github.com/whosramoss/dart-project",
      description: "dart-project",
      fork: true,
      createdAt: null,
      updatedAt: null,
      pushedAt: null,
      topics: ['FLUTTER', 'CODE', 'SERVICE'],
      language: 'Dart',
    ),
    GithubRepositoryEntity(
      id: 2,
      nodeId: "abcdef:",
      name: "go-project",
      fullName: "whosramoss/go-project",
      htmlUrl: "https://github.com/whosramoss/admin-portal",
      description: "go-project",
      fork: true,
      createdAt: null,
      updatedAt: null,
      pushedAt: null,
      topics: ['GOLANG', 'CODE', 'SERVICE'],
      language: 'Go',
    ),
  ];
  const resultEntity = <GithubLanguageEntity>[
    GithubLanguageEntity(
      name: 'Dart',
      icon:
          'https://raw.githubusercontent.com/devicons/devicon/master/icons/dart/dart-original.svg',
      average: '50%',
      total: 1,
    ),
    GithubLanguageEntity(
      name: 'Go',
      icon:
          'https://raw.githubusercontent.com/devicons/devicon/master/icons/go/go-original.svg',
      average: '50%',
      total: 1,
    ),
  ];

  setUpAll(() {
    findStatsLanguage = FindStatsLanguage();
  });

  group("[FindStatsLanguage]", () {
    test('All instances injected', () {
      expect(findStatsLanguage, isA<IFindStatsLanguage>());
    });

    test('Return a List<GithubLanguageEntity>', () {
      var result = findStatsLanguage(lstRepositoriesEntity);

      expect(result, isNotNull);
      expect(result, isA<List<GithubLanguageEntity>>());

      for (var i = 0; i < result.length; i++) {
        if (i != (result.length - 1)) {
          expect(result[i], equals(resultEntity[i]));
        }
      }
    });
  });
}
