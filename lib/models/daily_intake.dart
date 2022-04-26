import 'package:equatable/equatable.dart';
import 'package:openfoodfacts/model/Nutriments.dart';

import 'exercise.dart';

// ignore: must_be_immutable
class DailyIntake extends Equatable {
  Nutriments? breakfast;
  Nutriments? lunch;
  Nutriments? dinner;
  Nutriments? snack;
  Exercise? exercise;

  DailyIntake({this.breakfast, this.lunch, this.dinner, this.snack});

  getTotalDailyEnergyCal() {}

  @override
  List<Object?> get props => [
        breakfast,
        lunch,
        dinner,
        snack,
      ];
}
