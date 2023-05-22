import 'package:flutter/material.dart';
import '../models/plan_item.dart';

class PlanView extends StatelessWidget {
  final PlanItem plan;
  final bool isSelectedPlan;
  final Function(String) onSelectPlan;
  const PlanView(
      {super.key,
      required this.plan,
      required this.isSelectedPlan,
      required this.onSelectPlan});

  @override
  Widget build(BuildContext context) {
    final inclusions = "\n- ${plan.planInclusion.reduce(
      (value, element) => "$value\n- $element",
    )}";
    return Column(
      children: [
        const Spacer(),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          width: 300,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                width: double.infinity,
                child: Text(
                  plan.planName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                width: double.infinity,
                child: Text(
                  "\$${plan.amountPerYear} a year",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                width: double.infinity,
                child: Text(
                  "From \$${plan.amountPerHr}/hr + \$0.40/km \$${plan.amountPerDay} inc. 120km",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.black,
                  ),
                ),
              ),
              _planItem(Icons.person, "${plan.numberOfDrivers} drivers"),
              _planItem(Icons.credit_card, plan.cardDescription),
              _planItem(Icons.currency_exchange,
                  "Minimum total cost \$${plan.minimumTotalCost}\nincludes:$inclusions"),
              InkWell(
                onTap: () {
                  onSelectPlan(plan.planName);
                },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color:
                        isSelectedPlan ? Colors.orange : Colors.grey.shade100,
                  ),
                  width: double.infinity,
                  child: Text(
                    isSelectedPlan ? "SELECTED" : "SELECT THIS PLAN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color:
                          isSelectedPlan ? Colors.grey.shade100 : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Container _planItem(IconData icon, String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 1.0,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 24.0,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
