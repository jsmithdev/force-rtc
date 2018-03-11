# Fun with WebRTC + SalesForce

because experiments 🤓

## ForceRTC (class+page)

### State

Though WebRTC is peer connect, it needs a _server_ (or something) for signaling / initiation. I'd like to keep it in SalesForce if possible (until peer connection); Could chatter post the URL, could email it, could set time to meet on the object Connect__c and whoever get's to the record without an answer is Client1, etc. 

_unknowns == fun_ && _webrtc == options_

As is, this how signalling is setup: (Client1 is Alice and Client2 is Gene)

----

* Alice goes to the page with no params (read: no record id)
* She clicks Create Connection
* After ~20 seconds, it creates the Offer &
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

## Together (page)

Quick demo of Mozilla's Together.js + SalesForce

## Other Stuffs

more about webrtc [here](https://webrtc.github.io/samples/)

more about together.js [here](https://togetherjs.com/)