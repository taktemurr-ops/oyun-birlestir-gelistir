import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_birlestir_gelistir/oyun_birlestir_gelistir.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(birlestirGelistirConfig.title.length, 33);
    expect(birlestirGelistirConfig.tagline.length, 33);
    for (final s in birlestirGelistirConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(birlestirGelistirConfig.gameId, birlestirGelistirId);
    expect(birlestirGelistirRules.gameId, birlestirGelistirId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(birlestirGelistirRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: birlestirGelistirId, optionalMechanics: birlestirGelistirRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(birlestirGelistirRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
