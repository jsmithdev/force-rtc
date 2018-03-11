global class ForceRTC {

    public ForceRTC() {} // empty constructor
    
    @RemoteAction
    global static Connect__c mkConnection(String offer, String userId) {
        
        Connect__c conn = new Connect__c(
            Offer__c = offer,
            Responder__c = userId,
            Initializer__c = UserInfo.getUserId()
        );

        insert conn;
        
        return conn;
    }

    @RemoteAction
    global static Connect__c getConnection(String recId) {
        
        return [
            SELECT Id, Name, Answer__c, Offer__c, Initializer__c, Responder__c
            FROM Connect__c 
            WHERE Id = :recId
        ];
    }
    
    @RemoteAction
    global static Connect__c setAnswer(String recId, String answer) {
        
        Connect__c conn = [
            SELECT Id, Name, Answer__c, Offer__c, Initializer__c, Responder__c
            FROM Connect__c 
            WHERE Id = :recId
        ];

        conn.Answer__c = answer;

        update conn;

        return conn;
    }
    
    @RemoteAction
    global static List<User> getUsers() {
        // Normally User wouldn't connect to themselves but demo so...
        return [
            SELECT Id, Name, Email
            FROM User
            WHERE isActive = true
        ]; // AND Id != :UserInfo.getUserId()
    }
}