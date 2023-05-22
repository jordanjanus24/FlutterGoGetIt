class PlanItem {
  final String planName;
  final double amountPerYear;
  final double amountPerHr;
  final double amountPerDay;
  final int numberOfDrivers;
  final String cardDescription;
  final double minimumTotalCost;
  final List<String> planInclusion;
  const PlanItem({
    required this.planName,
    required this.amountPerYear,
    required this.amountPerHr,
    required this.amountPerDay,
    required this.numberOfDrivers,
    required this.cardDescription,
    required this.minimumTotalCost,
    required this.planInclusion,
  });
}
