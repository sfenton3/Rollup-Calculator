// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Content

/*
Map<String, Schema.SObjectType> gd = schema.getGlobalDescribe();
List<schema.SObjectType> gdList = gd.values();

public static void objs(List<schema.ChildRelationship> c){
    for (schema.ChildRelationship var : c){
        system.debug(var.getChildSObject() + ' ++ ' + var.getField() + ' ++ ' + var.getRelationshipName());

    }
}

for(schema.SObjectType var : gdList){
    if(!var.getDescribe().getChildRelationships().isEmpty()){
    system.debug('object name: ' + var);
    system.debug('object child lookups: ' + var.getDescribe().getChildRelationships());
    objs(var.getDescribe().getChildRelationships());
    }
}
*/
Integer i = 1;
for(String s : RollupCalculator.getParentObjects() ){
    system.debug(i + ' : ' + s);
    i++;
}

