part of contactmgr;

var softwareContactEntries;
void loadContacts(SoftwareRepo softwareRepo) {
  var softwareModels = 
      softwareRepo.getDomainModels(SoftwareRepo.softwareDomainCode); 
  softwareContactEntries = 
      softwareModels.getModelEntries(SoftwareRepo.softwareContactModelCode); 

  String json = window.localStorage['Contacts'];
  if ((json == null)||(json == '[]')) {
    initSoftwareContact(softwareContactEntries);  
    contacts = softwareContactEntries.contacts;     
  } else {
    contacts = softwareContactEntries.contacts;
    importContacts(json);
  }
  
  softwareContactEntries.display(); 
  softwareContactEntries.displayJson(); 
}


void importContacts(String json) {
  var v = JSON.decode(json);
  contacts.fromJson(JSON.decode(json)); //decode or parse
}

void persistContacts() {
  window.localStorage['Contacts'] = JSON.encode(contacts.toJson());
}

void toggleNewContactForm(Event e) { 
  var formInfo = document.querySelector('#divtoggleform');
  if (formInfo.style.display == 'none')
    formInfo.style.display = 'block';
  else
    formInfo.style.display = 'none';
  clearContact(); 
  tbFirstname.focus();
  lbMessage.text = "";

}

void openEditContactForm(Event e) { 
  var formInfo = document.querySelector('#divtoggleform');
  formInfo.style.display = 'block';
  tbFirstname.focus();
  lbMessage.text = "";
}

bool validateEntries(){
  var error = false;
  if (tbFirstname.value.trim() == "") error = true;
  if (tbLastname.value.trim() == "") error = true;  
  if (tbTelephone.value.trim() == "") error = true;
  //if (tbEmail.value.trim() == '') error = true;  //Email is OPTIONAL
  return error;
}

bool validateTelephone(){
  String expTelephone = "[0-9]+"; //or String expTelephone = "\\d+";
  RegExp regex = new RegExp(expTelephone);
  if (regex.hasMatch(tbTelephone.value))
    return true;
  else
    return false;  
}

bool validateEmail(){
  String expEmail= "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})\$";
  RegExp regex = new RegExp(expEmail);
  
  if(tbEmail.value.trim() == "") 
      return true;
  else
    if (regex.hasMatch(tbEmail.value))
      return true;
    else return false;
}

void clearContact() {
  tbFirstname.value = "";
  tbLastname.value = "";
  tbTelephone.value = "";
  tbEmail.value = "";
}

void saveContact(Event e) {
  lbMessage.text = "";
  if(!validateEntries())
  {
    if (validateTelephone()){
      
      if (validateEmail()){   
        if(updateContactCode == ''){
        addContact();
        }else{
          updateContact();
        }         
        
      }else{
        lbMessage.text = "Please, enter a valide email address like XXX'@'YYY.ZZZ\n";;
      }     
    }else{
      lbMessage.text = "Please, enter only number for the telephone\n";
    }
  }else {
    lbMessage.text = 'Please, fill the form correctly!\n';
  }
}

void editContact(Event e) {
  String code = (e.target as ButtonElement).value; 
  Contact contact = contacts.singleWhereCode(code);
  tbFirstname.value = contact.firstname;
  tbLastname.value = contact.lastname;
  tbTelephone.value = contact.telephone;
  tbEmail.value = contact.email;
  openEditContactForm(e);
  updateContactCode = code;
  //lbMessage.text = contact.code; //see uuid
}

void addContact() {
  Contact contact = new Contact(softwareContactEntries.contacts.concept); 
  contact.firstname = tbFirstname.value; 
  contact.lastname = tbLastname.value;
  contact.telephone = tbTelephone.value;
  contact.email = tbEmail.value;

  contact.code = uuid.v4(); //It is improtant to set code, because of using to add, remove, etc.
  if(contacts.add(contact)){

    persistContacts();
    orderContactByLastname(); //alpha order???...   
    displayContactTable();
  }
  //clear anyway!
  clearContact();  
}

void orderContactByLastname() {
//  contacts.order(((Contact c1, Contact c2) => 
//      (c1.lastname.toUpperCase().compareTo(c2.lastname.toUpperCase()))));  
}

void updateContact() {
  Contact contact = contacts.singleWhereCode(updateContactCode);
  contact.firstname = tbFirstname.value; 
  contact.lastname = tbLastname.value;
  contact.telephone = tbTelephone.value;
  contact.email = tbEmail.value;
  persistContacts();
  orderContactByLastname();  
  displayContactTable();  
  clearContact();
  updateContactCode = '';
}

//message.text = 'Conatct with that name already exists';
void deleteContact(Event e) {  
  String code = (e.target as ButtonElement).value; 
  Contact contact = contacts.singleWhereCode(code);
  contacts.remove(contact);
  persistContacts();
  clearContact();
  displayContactTable();
}

void displayContactTable() {
  //build the data table
  String contactTable =
  //thead
      '''
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td  class="list-tableHeaderL">Last name</td>
            <td  class="list-tableHeaderL">First name</td>
            <td  class="list-tableHeaderL">Telephone</td>
            <td  class="list-tableHeaderL">Email</td>
            <td  class="list-tableHeaderR">Action</td>
        </tr>
        <tr>
        <!--Display text if no contact-->          
      ''';
  //tbody content
  int count = 1;
  String style;
  for (Contact contact in contacts) {
    //print(count % 2);
    if(count % 2 == 0)
      style = 'class="list-tableRowA"';
    else
      style = 'class="list-tableRowB"';
    var row =
    '''
    <tr ${style}>
        <td>${contact.lastname}</td>
        <td>${contact.firstname}</td> 
        <td>${contact.telephone}</td>
        <td>${contact.email}</td>
        <td align="right">
          <button id="deletecontact${count}" class="list-button">Delete</button>
          <button id="editcontact${count}" class="list-button">Update</button>
        </td>
    </tr>
    ''';
    contactTable = '$contactTable ${row}';   
    count++;
    }
  
  //tfoot
  String endTable = "</table>";
  contactTable = '$contactTable ${endTable}';
  
  tableContacts.setInnerHtml(
      contactTable,
        validator: new NodeValidatorBuilder()
        ..allowHtml5()
        //..allowElement('a', attributes: ['href'])  
        );
  
  int nr = 1;
  for (Contact contact in contacts) {  
    ButtonElement btnDelete = querySelector('#deletecontact${nr}');
    btnDelete.value = contact.code;
    btnDelete.onClick.listen(deleteContact);
    
    ButtonElement btnEdit = querySelector('#editcontact${nr}');
    btnEdit.value = contact.code;
    btnEdit.onClick.listen(editContact);   
    nr++;
    }  
}
