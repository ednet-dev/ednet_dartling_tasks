part of ednet_core_tasks;

// lib/gen/ednet_core/tasks/employees.dart

abstract class EmployeeGen extends Entity<Employee> {
  EmployeeGen(Concept concept) {
    this.concept = concept;
    Concept? taskConcept = concept.model.concepts.singleWhereCode("Task");
    setChild("tasks", Tasks(taskConcept!));
  }

  EmployeeGen.withId(Concept concept, String email) {
    this.concept = concept;
    setAttribute("email", email);
    Concept? taskConcept = concept.model.concepts.singleWhereCode("Task");
    setChild("tasks", new Tasks(taskConcept!));
  }

  String get email => getAttribute("email");

  set email(String a) => setAttribute("email", a);

  String get lastName => getAttribute("lastName");

  set lastName(String a) => setAttribute("lastName", a);

  String get firstName => getAttribute("firstName");

  set firstName(String a) => setAttribute("firstName", a);

  Tasks get tasks => getChild("tasks") as Tasks;

  Employee newEntity() => new Employee(concept);

  Employees newEntities() => new Employees(concept);

  int emailCompareTo(Employee other) {
    return email.compareTo(other.email);
  }
}

abstract class EmployeesGen extends Entities<Employee> {
  EmployeesGen(Concept concept) {
    this.concept = concept;
  }

  Employees newEntities() => new Employees(concept);

  Employee newEntity() => new Employee(concept);
}
