library contactmgr; 
// web/software/contact/software_contact_web.dart 
 
import "dart:html"; 
import "package:dartling/dartling.dart"; 
//import "package:dartling_default_app/dartling_default_app.dart"; 
import "package:software_contact/software_contact.dart"; 
import 'package:uuid/uuid.dart';
import 'dart:convert';

part 'contactmgrAPI.dart';
 
InputElement tbFirstname; 
InputElement tbLastname; 
InputElement tbTelephone; 
InputElement tbEmail;  

ButtonElement btnSaveContact;
ButtonElement btnAddContact;
ButtonElement btnCloseForm;

var tableContacts;
var lbMessage;
Contacts contacts;
String updateContactCode='';
var uuid;


initControls() {
  //
  tbFirstname = document.querySelector('#firstname');
  tbLastname = document.querySelector('#lastname');
  tbTelephone = document.querySelector('#telephone');
  tbEmail = document.querySelector('#email');
  
  lbMessage = document.querySelector("#message");

  btnAddContact = document.querySelector('#addnewcontact');
  btnSaveContact = document.querySelector('#savecontact');
  btnCloseForm = document.querySelector('#closeform'); 
  
  tableContacts = document.querySelector('#tablecontacts'); 
  
  //
  btnAddContact.onClick.listen(toggleNewContactForm);  
  btnSaveContact.onClick.listen(saveContact);
  btnCloseForm.onClick.listen(toggleNewContactForm);   
  
}


void main() { 
  
  initControls();
  uuid = new Uuid();
  //print(uuid.v4());
  
  var softwareRepo = new SoftwareRepo();
  loadContacts(softwareRepo);
  orderContactByLastname();
  displayContactTable();   
  
} 
 
/*
initSoftwareData(SoftwareRepo softwareRepo) { 
   var softwareModels = 
       softwareRepo.getDomainModels(SoftwareRepo.softwareDomainCode); 
 
   var softwareContactEntries = 
       softwareModels.getModelEntries(SoftwareRepo.softwareContactModelCode); 
   initSoftwareContact(softwareContactEntries); 

   softwareContactEntries.display(); 
   softwareContactEntries.displayJson(); 
} 
 
showSoftwareData(SoftwareRepo softwareRepo) { 
   var mainView = new View(document, "main"); 
   mainView.repo = softwareRepo; 
   new RepoMainSection(mainView); 
} 

void main() { 
  var softwareRepo = new SoftwareRepo(); 
  initSoftwareData(softwareRepo); 
  showSoftwareData(softwareRepo);  
} 

*/