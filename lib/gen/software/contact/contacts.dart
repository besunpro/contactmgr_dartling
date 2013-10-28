part of software_contact; 
 
// lib/gen/software/contact/contacts.dart 
 
abstract class ContactGen extends ConceptEntity<Contact> { 
 
  ContactGen(Concept concept) : super.of(concept); 
 
  String get lastname => getAttribute("lastname"); 
  set lastname(String a) => setAttribute("lastname", a); 
  
  String get firstmane => getAttribute("firstmane"); 
  set firstmane(String a) => setAttribute("firstmane", a); 
  
  num get telephone => getAttribute("telephone"); 
  set telephone(num a) => setAttribute("telephone", a); 
  
  String get email => getAttribute("email"); 
  set email(String a) => setAttribute("email", a); 
  
  Contact newEntity() => new Contact(concept); 
  Contacts newEntities() => new Contacts(concept); 
  
} 
 
abstract class ContactsGen extends Entities<Contact> { 
 
  ContactsGen(Concept concept) : super.of(concept); 
 
  Contacts newEntities() => new Contacts(concept); 
  Contact newEntity() => new Contact(concept); 
  
} 
 
