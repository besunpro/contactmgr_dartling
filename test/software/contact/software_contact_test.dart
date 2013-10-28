 
// test/software/contact/software_contact_test.dart 
 
import "package:unittest/unittest.dart"; 
 
import "package:dartling/dartling.dart"; 
 
import "package:software_contact/software_contact.dart"; 
 
testSoftwareContact(Repo repo, String domainCode, String modelCode) { 
  var models; 
  var session; 
  var entries; 
  
  Contacts contacts;
  
  group("Testing ${domainCode}.${modelCode}", () { 
    setUp(() { 
      models = repo.getDomainModels(domainCode); 
      session = models.newSession(); 
      entries = models.getModelEntries(modelCode); 
      expect(entries, isNotNull); 
 
      contacts = entries.contacts;
      initSoftwareContact(entries);    
      
      String code = "c7057a18-00e3-42b1-9cb3-b8028ff010b6";
      var contact = contacts.singleWhereCode(code);
      
    }); 
    tearDown(() { 
      entries.clear(); 
    }); 
    test("Empty Entries Test", () { 
      expect(entries.isEmpty, isFalse); 
    });     
    test('Find Contact by code', () {
      var contact = contacts.singleWhereCode('2c4f50e4-d191-4024-9d8a-0d037d380da2');
      expect(contact, isNotNull);
      expect(contact.code, equals('2c4f50e4-d191-4024-9d8a-0d037d380da2'));
      contacts.display(title:'Find Contact by code');
    });       
    test('From Contact Model to JSON', () {
      var json = entries.toJson();
      expect(json, isNotNull);
      entries.displayJson();
    });   
 
  }); 
} 
 
testSoftwareData(SoftwareRepo softwareRepo) { 
  testSoftwareContact(softwareRepo, SoftwareRepo.softwareDomainCode, 
      SoftwareRepo.softwareContactModelCode); 
} 
 
void main() { 
  var softwareRepo = new SoftwareRepo(); 
  testSoftwareData(softwareRepo); 
} 
 
