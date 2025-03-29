public with sharing class RegistrationController {
    @AuraEnabled
    public static void registerForEvent(Registration__c regObj) {
        insert regObj;
    }
}
