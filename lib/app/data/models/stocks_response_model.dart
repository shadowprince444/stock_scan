import 'package:flutter/material.dart';
import 'package:stock_scan/app/enums/app_enums.dart';

class StocksResponseModel {
  StocksResponseModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  late final int id;
  late final String name;
  late final String tag;
  late final Color color;
  late final List<Criteria> criteria;

  StocksResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = getColorFromString(json['color']);
    criteria = List.from(json['criteria']).map((e) => Criteria.fromJson(e)).toList();
  }

  Color getColorFromString(String? color) {
    switch (color) {
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

// Map<String, dynamic> toJson() {
//   final data = <String, dynamic>{};
//   data['id'] = id;
//   data['name'] = name;
//   data['tag'] = tag;
//   data['color'] = color;
//   data['criteria'] = criteria.map((e) => e.toJson()).toList();
//   return data;
// }
}

class Criteria {
  Criteria({
    required this.type,
    required this.text,
    required this.variables,
  });

  late final CriteriaType type;
  late final String text;
  late final List<Variable> variables;

  Criteria.fromJson(Map<String, dynamic> json) {
    type = stringToCriteriaType(json['type']);
    text = json['text'];
    if (type == CriteriaType.variable) {
      List<Variable> tempList = [];
      for (String key in json["variable"].keys) {
        tempList.add(
          Variable.fromJson(
            json["variable"][key],
            key,
          ),
        );
      }
      variables = tempList;
      // String tempString=   json['text'];
      // for(Variable v in tempList){
      //   if(v.type==VariableType.value){
      //     tempString=tempString.replaceFirst(v.jsonKey, v.valueList!.values.first.toString());
      //   }else{
      //     tempString=tempString.replaceFirst(v.jsonKey, v.indicators!.defaultValue.toString());
      //
      //   }
      // }
    }
  }

  CriteriaType stringToCriteriaType(String criteriaType) {
    switch (criteriaType) {
      case "variable":
        return CriteriaType.variable;
      case "plain_text":
        return CriteriaType.plainText;
      default:
        return CriteriaType.undefined;
    }
  }
}

class Variable {
  Variable({
    required this.indicators,
    required this.valueList,
  });

  late final String jsonKey;
  late final VariableType type;
  late final Indicators? indicators;
  late final ValuesList? valueList;

  Variable.fromJson(Map<String, dynamic> json, String key) {
    jsonKey = key;
    type = stringToVariableType(json["type"]);
    if (type == VariableType.indicator) {
      indicators = Indicators.fromJson(json);
    } else {
      valueList = ValuesList.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (type == VariableType.indicator) {
      data[jsonKey] = indicators?.toJson();
    } else {
      data[jsonKey] = valueList?.toJson();
    }
    return data;
  }

  VariableType stringToVariableType(String variableTypeString) {
    switch (variableTypeString) {
      case "indicator":
        return VariableType.indicator;
      case "value":
        return VariableType.value;
      default:
        return VariableType.undefined;
    }
  }
}

class Indicators {
  Indicators({
    required this.studyType,
    required this.parameterName,
    required this.minValue,
    required this.maxValue,
    required this.defaultValue,
  });

  late final String studyType;
  late final String parameterName;
  late final int minValue;
  late final int maxValue;
  late final int defaultValue;

  Indicators.fromJson(Map<String, dynamic> json) {
    studyType = json['study_type'];
    parameterName = json['parameter_name'];
    minValue = json['min_value'];
    maxValue = json['max_value'];
    defaultValue = json['default_value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['study_type'] = studyType;
    data['parameter_name'] = parameterName;
    data['min_value'] = minValue;
    data['max_value'] = maxValue;
    data['default_value'] = defaultValue;
    return data;
  }
}

class ValuesList {
  ValuesList({
    required this.values,
  });

  late final List<double> values;

  ValuesList.fromJson(Map<String, dynamic> json) {
    values = List.generate(
        json['values'].length,
        (e) => double.parse(
              json['values'][e].toString(),
            ));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['values'] = values;
    return data;
  }
}
