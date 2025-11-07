#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk

/**
 * The PEER_OBJECT structure contains application-specific run-time information that can be shared with trusted contacts within a peer collaboration network.
 * @remarks
 * 
 * Peer objects are run-time data items associated with a particular application, such as a picture or avatar, a certificate, or a specific description. Each peer object must be smaller than 16K in size.
 * 
 * Trusted contacts watching this peer object will have a PEER_EVENT_OBJECT_CHANGED event raised on them signaling this peer object's change in status.
 * 
 * Peer object information is contained in the <b>data</b> member of this structure and  represented as a byte buffer with a maximum size of 16K.
 * 
 * The lifetime of a peer object is tied to the lifetime of the application that registered it.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_object
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_OBJECT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * GUID value under which the peer object is uniquely registered.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains information which describes the peer object.
     * @deprecated
     * @type {PEER_DATA}
     */
    data{
        get {
            if(!this.HasProp("__data"))
                this.__data := PEER_DATA(8, this)
            return this.__data
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_publication_scope">PEER_PUBLICATION_SCOPE</a> enumeration value that specifies the publication scope for this peer object.
     * @type {Integer}
     */
    dwPublicationScope {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
