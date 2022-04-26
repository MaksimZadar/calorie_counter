import 'package:equatable/equatable.dart';
import 'package:openfoodfacts/model/Nutriments.dart';

import 'exercise.dart';

// ignore: must_be_immutable
class DailyIntake extends Equatable {
  List<Nutriments>? breakfast;
  List<Nutriments>? lunch;
  List<Nutriments>? dinner;
  List<Nutriments>? snack;
  List<Exercise>? exercise;

  DailyIntake({
    this.breakfast,
    this.lunch,
    this.dinner,
    this.snack,
    this.exercise,
  });

  getTotalDailyEnergyCal() {}
  getTotalDailyEnergyKj() {}

  getTotalDailyProtein() {}
  getTotalDailyCarbohydrates() {}
  getTotalDailyFats() {}
  // TODO: Add more gets for other nutrients

  @override
  List<Object?> get props => [
        breakfast,
        lunch,
        dinner,
        snack,
        exercise,
      ];
}
