import 'package:flutter_code_test/models/plan_item.dart';

const List<PlanItem> defaultPlans = [
  PlanItem(
    planName: "GoStarter",
    amountPerYear: 49,
    amountPerHr: 11.70,
    amountPerDay: 96,
    numberOfDrivers: 1,
    cardDescription: "Pay to stay a member once a year",
    minimumTotalCost: 49,
    planInclusion: [
      "Annual membership fee",
      "\$1 pre-authorization on sign-up"
    ],
  ),
  PlanItem(
    planName: "GoOccasional",
    amountPerYear: 12,
    amountPerHr: 10.2,
    amountPerDay: 90,
    numberOfDrivers: 2,
    cardDescription: "Month to month",
    minimumTotalCost: 37,
    planInclusion: [
      "1 month membership",
      "\$25 joining fee per driver",
      "\$1 pre-authorization on sign-up"
    ],
  ),
  PlanItem(
    planName: "GoFrequent",
    amountPerYear: 30,
    amountPerHr: 7.0,
    amountPerDay: 80,
    numberOfDrivers: 4,
    cardDescription: "Month to month",
    minimumTotalCost: 55,
    planInclusion: [
      "1 month membership",
      "\$25 joining fee per driver",
      "\$1 pre-authorization on sign-up"
    ],
  ),
];
