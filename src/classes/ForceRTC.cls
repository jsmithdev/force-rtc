global class ForceRTC {

    public ForceRTC() {} // empty constructor
    
    @RemoteAction
    global static Connect__c mkConnection(String offer) {
        
        Connect__c conn = new Connect__c(
            Offer__c = offer,
            Initializer__c = UserInfo.getUserId()
        );

        insert conn;
        
        return conn;
    }

    @RemoteAction
    global static Connect__c getConnection(String recId) {
        
        return [
            SELECT Id, Name, Answer__c, Offer__c, Initializer__c
            FROM Connect__c 
            WHERE Id = :recId
        ];
    }
    
    @RemoteAction
    global static Connect__c setAnswer(String recId, String answer) {
        
        Connect__c conn = [
            SELECT Id, Name, Answer__c, Offer__c, Initializer__c
            FROM Connect__c 
            WHERE Id = :recId
        ];

        conn.Answer__c = answer;

        update conn;

        return conn;
    }
}