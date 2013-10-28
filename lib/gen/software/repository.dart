part of software_contact; 
 
// lib/gen/software/repository.dart 
 
class SoftwareRepo extends Repo { 
 
  static final softwareDomainCode = "Software"; 
  static final softwareContactModelCode = "Contact"; 
 
  SoftwareRepo([String code="SoftwareRepo"]) : super(code) { 
    _initSoftwareDomain(); 
  } 
 
  _initSoftwareDomain() { 
    var softwareDomain = new Domain(softwareDomainCode); 
    domains.add(softwareDomain); 
    add(new SoftwareModels(softwareDomain)); 
  } 
 
} 
 
