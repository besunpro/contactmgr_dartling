                                                                                part of software_contact; 
 
// lib/software/contact/init.dart 
 
initSoftwareContact(var entries) { 
  _initContacts(entries); 
} 
 
_initContacts(var entries) { 
  Contact contact = new Contact(entries.contacts.concept); 
  contact.code = "3b3444d3-4fdb-4365-a8df-ff06921faf38";
  contact.lastname = "droter"; 
  contact.firstname = "bernard"; 
  contact.telephone = "4185564589"; 
  contact.email = "bernard.droter@gmail.com"; 
  entries.contacts.add(contact); 
 
  contact = new Contact(entries.contacts.concept); 
  contact.code = "5597e04e-d1f9-4087-9306-1ad619ab2496";
  contact.lastname = "tramblay"; 
  contact.firstname = "brice"; 
  contact.telephone = "4185552740"; 
  contact.email = "brice.tremblay@videotron.ca"; 
  entries.contacts.add(contact); 
 
  contact = new Contact(entries.contacts.concept);
  contact.code = "2c4f50e4-d191-4024-9d8a-0d037d380da2";
  contact.lastname = "Vandal"; 
  contact.firstname = "Roger"; 
  contact.telephone = "19027088300"; 
  contact.email = ""; 
  entries.contacts.add(contact);   
  
  contact = new Contact(entries.contacts.concept); 
  contact.code = "c7057a18-00e3-42b1-9cb3-b8028ff010b6";
  contact.lastname = "Martin"; 
  contact.firstname = "Bondieu"; 
  contact.telephone = "5145552740"; 
  contact.email = ""; 
  entries.contacts.add(contact); 
 
} 
 
