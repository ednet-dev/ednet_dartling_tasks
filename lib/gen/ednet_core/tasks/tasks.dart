part of ednet_core_tasks; 
 
// lib/gen/ednet_core/tasks/tasks.dart 
 
abstract class TaskGen extends Entity<Task> { 
 
  TaskGen(Concept concept) {
    this.concept = concept;
  }
 
  TaskGen.withId(Concept concept, Project project, Employee employee) { 
    this.concept = concept;
    setParent("project", project); 
    setParent("employee", employee); 
  } 
 
  Project get project => getParent("project") as Project;
  set project(Project p) => setParent("project", p); 
  
  Employee get employee => getParent("employee") as Employee;
  set employee(Employee p) => setParent("employee", p); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  Task newEntity() => new Task(concept); 
  Tasks newEntities() => new Tasks(concept); 
  
} 
 
abstract class TasksGen extends Entities<Task> { 
 
  TasksGen(Concept concept) {
    this.concept = concept;
  }
 
  Tasks newEntities() => new Tasks(concept); 
  Task newEntity() => new Task(concept); 
  
} 
 
