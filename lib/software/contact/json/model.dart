part of software_contact;

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// lib/software/contact/json/model.dart

var softwareContactModelJson = r'''
{
    "width":990,
    "height":580,
    "boxes":[
        {
            "name":"Contact",
            "entry":true,
            "x":133,
            "y":99,
            "width":120,
            "height":120,
            "items":[
                {
                    "sequence":10,
                    "name":"code",
                    "category":"guid",
                    "type":"String",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"lastname",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"firstmane",
                    "category":"attribute",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":40,
                    "name":"telephone",
                    "category":"attribute",
                    "type":"num",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":50,
                    "name":"email",
                    "category":"attribute",
                    "type":"Email",
                    "init":"",
                    "essential":false,
                    "sensitive":false
                }
            ]
        }
    ],
    "lines":[
        
    ]
}
''';
  