# Fun with WebRTC + SalesForce

because experiments 🤓

## ForceRTC (class+page)

### State

Though WebRTC has super peer connection powers, it needs a _server_ (or something) for signaling / initiation relay. ClientA wants to connect to ClientB, A makes an Offer, B gets Offer and makes Answer which ClientA can establish with. I'm trying to keep it all in SalesForce and provide a peer connection. You could chatter post the URL, could email it, could set time to meet on the object Connect__c and whoever gets to the record without an answer is Client1, etc.

As is, this how signalling is setup:

----

* Client1 goes to the page with no params (read: no record id)
* She clicks Create Connection
* After ~20 seconds, page will have created the Offer &
* JS Remotes, inserting Connect__c obj with Offer__c set &
* Starts polling every 20 seconds via Remote JS with Id until Answer__c is found

----

* Client2 goes to the page with the id of the Connect__c Client1 created
* The JS see's the param and SOQL for rec and sets the Answer__c

----

* Client1's polling finds Client2's Answer__c
* Profit! (Establishes Peer Connection)

----
Screen shot - Client1: My computer looking at itself. Client2: My phone.
![screen shot](https://i.imgur.com/XeWj5q8.png)

### Update

Added User select for Client1 to choose who to connect to.
When Connection is created, assigns Responder__c to selected User.Id (it's a look up)
That'll be used to build a table of available Connections for Client2 (or Client1 too perhaps)

## Together (page)

Quick demo of Mozilla's Together.js + SalesForce

## Other Stuffs

more about webrtc [here](https://webrtc.github.io/samples/)

more about together.js [here](https://togetherjs.com/)

## Deploy

Covert with SFDX; This creates a folder called `deploy`

```bash
sfdx force:source:convert -r force-app -d deploy
```

Now you can deploy from the resulting `deploy` directory

```bash
sfdx force:mdapi:deploy -d deploy -w -1  --verbose 
```

📌  Above deploys to the default org set

* Add `-u user@domain.com` or `-u alias` to deploy else where

* To run tests add `-l RunSpecifiedTests -r ApexTestName`

Results should more or less mirror below

```bash
Using specified username user@org.com

*** Deploying with SOAP ***

Job ID | 0Af1U000019LEW5SAO

MDAPI PROGRESS | ████████████████████████████████████████ | 5/5 Components
```
