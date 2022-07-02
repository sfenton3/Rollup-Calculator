public with sharing class RollupCalculator {

    @AuraEnabled(cacheable=true)
    public static List<String> getParentObjects(){
        Map<String, Schema.SObjectType> gd = schema.getGlobalDescribe();
        List<schema.SObjectType> gdList = gd.values();

        set<String> pObjs = new set<String>();

        for(schema.SObjectType var : gdList){
            if(!var.getDescribe().getChildRelationships().isEmpty()){
                system.debug(var.getDescribe().getKeyPrefix());
                pObjs.add(var.getDescribe().getName());
            }
        }

        List<String> nl = new List<String>(pObjs);
        nl.sort();
        return nl;
    }   
}
