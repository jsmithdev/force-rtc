# Fun with WebRTC + SalesForce

because experiments 🤓

## ForceRTC (class+page)

### State

Though WebRTC has super peer connection powers, it needs a _server_ (or something) for signaling / initiation relay. ClientA wants to connect to ClientB, A makes an Offer, B gets Offer and makes Answer which ClientA can establish with. I'm trying to keep it all in SalesForce and provide a peer connection. You could chatter post the URL, could email it, could set time to meet on the object Connect__c and whoever get's to the record without an answer is Client1, etc.

_unknowns == fun_ && _webrtc == options_

As is, this how signalling is setup: (Client1 is Alice and Client2 is Gene)

----

* Alice goes to the page with no params (read: no record id)
* She clicks Create Connection
* After ~20 seconds, page will have created the Offer &
* JS Remotes, inserting Connect__c obj with Offer__c set &
* Starts polling every 20 seconds via Remote JS with Id until Answer__c is found

----

* Gene goes to the page with the id of the Connect__c Alice created
* The JS see's the param and SOQL's for rec and sets the Answer__c

----

* Alice's polling finds Gene's Answer__c
* Profit! (Establish's Peer Connection)

----
Screen shot - Client1: My computer looking at itself. Client2: My phone.
![screenie](https://i.imgur.com/XeWj5q8.png)

### Update

Added User select for Alice to choose who to connect to.
When Connection is created, assigns Responder__c to selected User.Id (it's a look up)
That'll be used to build a table of available Connections for Gene (or Alice too perhaps)

## Together (page)

Quick demo of Mozilla's Together.js + SalesForce

## Other Stuffs

more about webrtc [here](https://webrtc.github.io/samples/)

more about together.js [here](https://togetherjs.com/)