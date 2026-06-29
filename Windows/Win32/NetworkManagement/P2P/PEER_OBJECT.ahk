#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_OBJECT structure contains application-specific run-time information that can be shared with trusted contacts within a peer collaboration network.
 * @remarks
 * Peer objects are run-time data items associated with a particular application, such as a picture or avatar, a certificate, or a specific description. Each peer object must be smaller than 16K in size.
 * 
 * Trusted contacts watching this peer object will have a PEER_EVENT_OBJECT_CHANGED event raised on them signaling this peer object's change in status.
 * 
 * Peer object information is contained in the <b>data</b> member of this structure and  represented as a byte buffer with a maximum size of 16K.
 * 
 * The lifetime of a peer object is tied to the lifetime of the application that registered it.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_object
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_OBJECT {
    #StructPack 8

    /**
     * GUID value under which the peer object is uniquely registered.
     */
    id : Guid

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains information which describes the peer object.
     * @deprecated
     */
    data : PEER_DATA

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_publication_scope">PEER_PUBLICATION_SCOPE</a> enumeration value that specifies the publication scope for this peer object.
     */
    dwPublicationScope : UInt32

}
