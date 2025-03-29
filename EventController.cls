public with sharing class EventController {
    @AuraEnabled
    public static void createEvent(Event__c eventObj) {
        insert eventObj;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Event__c> getEvents() {
        return [SELECT Id, Name FROM Event__c];
    }
}
