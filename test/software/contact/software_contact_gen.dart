 
// test/software/contact/software_contact_gen.dart 
 
import "package:dartling/dartling.dart"; 
 
import "package:software_contact/software_contact.dart"; 
 
genCode() { 
  var repo = new Repo(); 
 
  var softwareDomain = new Domain("Software"); 
 
  Model softwareContactModel = 
      fromJsonToModel(softwareContactModelJson, softwareDomain, "Contact"); 
 
  repo.domains.add(softwareDomain); 
 
  repo.gen("software_contact"); 
} 
 
initSoftwareData(SoftwareRepo softwareRepo) { 
   var softwareModels = 
       softwareRepo.getDomainModels(SoftwareRepo.softwareDomainCode); 
 
   var softwareContactEntries = 
       softwareModels.getModelEntries(SoftwareRepo.softwareContactModelCode); 
   initSoftwareContact(softwareContactEntries); 
   softwareContactEntries.display(); 
   softwareContactEntries.displayJson(); 
} 
 
void main() { 
  genCode(); 
 
  var softwareRepo = new SoftwareRepo(); 
  initSoftwareData(softwareRepo); 
} 
 
