//after update trigger.

trigger CustomerTrigger on Apex_Customer__c (after update) {

    List<Apex_Invoice__c> updateList = new List<Apex_Invoice__c>();
    for(Apex_Customer__c obj : Trigger.new){
            if(obj.Apex_Customer_Status__c == 'Active'){
            Apex_Invoice__c n = new Apex_Invoice__c();
            n.Apex_Status__c = 'Pending';
            n.Apex_Customer__c = obj.id;
            updateList.add(n);
            }
            
    }
    insert updateList;
    
