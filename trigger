//after update trigger.

trigger CustomerTrigger on Apex_Customer__c (after update) {

 //Invoice will create if previous status should be pending.
    List<Apex_Invoice__c> updateList = new List<Apex_Invoice__c>();
    for(Apex_Customer__c obj : Trigger.new){
            if(obj.Apex_Customer_Status__c == 'Active' &&
               trigger.oldMap.get(obj.id).apex_customer_status__c == 'Pending'){
            Apex_Invoice__c n = new Apex_Invoice__c();
            n.Apex_Status__c = 'Pending';
            n.Apex_Customer__c = obj.id;
            updateList.add(n);
            }
            
    }
    insert updateList;
    
}


//Insert Trigger

trigger SimpleTrigger on Account (after insert) 
{
     List<Contact> contactList = new List<Contact>();
     for(Account a : Trigger.new){
         
         Contact c = new Contact();
         c.title= a.Name;
         c.lastName = a.Name;
         contactList.add(c);
         
     
     }
     insert contactList;
}
