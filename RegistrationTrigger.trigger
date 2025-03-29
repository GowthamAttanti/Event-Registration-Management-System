trigger RegistrationTrigger on Registration__c (after insert) {
    Set<Id> eventIds = new Set<Id>();

    for (Registration__c reg : Trigger.new) {
        eventIds.add(reg.Event__c);
    }

    List<Event__c> eventsToUpdate = [SELECT Id, Available_Seats__c FROM Event__c WHERE Id IN :eventIds];

    for (Event__c evt : eventsToUpdate) {
        evt.Available_Seats__c -= 1;
    }

    update eventsToUpdate;
}
