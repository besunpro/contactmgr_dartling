part of software_contact; 
 
// lib/gen/software/models.dart 
 
class SoftwareModels extends DomainModels { 
 
  SoftwareModels(Domain domain) : super(domain) { 
    add(fromJsonToContactEntries()); 
  } 
 
  ContactEntries fromJsonToContactEntries() { 
    return new ContactEntries(fromJsonToModel( 
      softwareContactModelJson, 
      domain, 
      SoftwareRepo.softwareContactModelCode)); 
  } 
 
} 
 
