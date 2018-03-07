# hello

this is nothing much yet. still need to add signaling, etc. this is here to see what happens when WebRTC meets SalesForce. I'm really busy but I'm tired of this boucing around in my head so I figured I'd just start it.

Though WebRTC is peer connect, it needs a _server_ for initiation at least. I'd like to keep it in SalesForce if possible (until peer connection); Maybe an Object is in order. Could soql record on room #, insert if not found _or_ each call = new record. Fields could update with handshake info, call length, etc. Perhaps pole via Remote annotation. _Unknowns == Fun_

more about webrtc [here](https://webrtc.github.io/samples/)