/// criteria types from the [API] data
enum CriteriaType {
  ///represents a varying field like[TextFields] or [Dropdowns].
  variable,

  /// plain text data to be displayed
  plainText,

  /// undefined Criteria
  undefined
}

///variable types
enum VariableType {
  ///text fields
  indicator,

  ///list of values(like a dropdown)
  value,

  ///undefined variableType
  undefined
}
