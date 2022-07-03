//Set of controller methods for LWC
public with sharing class RollupCalculator {

    //Get all Sobjects with child relationships
    //Skip objects with no record prefix id?
    @AuraEnabled(cacheable=true)
    public static List<String> getParentObjects(){
        Map<String, Schema.SObjectType> gd = schema.getGlobalDescribe();
        List<schema.SObjectType> gdList = gd.values();
        List<String> pObjs = new List<String>();

        for(schema.SObjectType var : gdList){
            if( hasChildren(var) ){
                pObjs.add( getName(var) );
            }
        }
        pObjs.sort();
        return pObjs;
    }

    //Get all sobjects that are children of a given parent object
    @AuraEnabled(cacheable=true)
    public static List<String> getChildObjects (String pObj) {
        List<Schema.ChildRelationship> children = getChildren(pObj);
        List<String> cObjs = new List<String>();

        for( Schema.ChildRelationship var : children ) {
            if (var.getRelationshipName() == null){
                continue;
            }
            cObjs.add( var.getRelationshipName() );
        }

        cObjs.sort();
        return cObjs;
    }


    
    public static boolean hasChildren( Schema.SObjectType obj) {
        return !(obj.getDescribe().getChildRelationships().isEmpty());
    }

    public static string getName( Schema.SObjectType obj ) {
        return obj.getDescribe().getName();
    }

    public static string getLabel( Schema.SObjectType obj ) {
        return obj.getDescribe().getLabel();
    }
    
    public static List<Schema.ChildRelationship> getChildren(String pObj) {
        SObject obj = (SObject) type.forName('schema', pObj ).newInstance();
        return obj.getSObjectType().getDescribe().getChildRelationships();
    }

}
