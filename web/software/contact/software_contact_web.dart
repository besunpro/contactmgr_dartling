 
// web/software/contact/software_contact_web.dart 
 
import "dart:html"; 
 
import "package:dartling/dartling.dart"; 
import "package:dartling_default_app/dartling_default_app.dart"; 
 
import "package:software_contact/software_contact.dart"; 
 
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
 
