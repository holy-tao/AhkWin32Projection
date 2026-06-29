#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_APPLICATION structure contains data describing a locally installed software application or component that can be registered and shared with trusted contacts within a peer collaboration network.
 * @remarks
 * An "application" is a set of software or software  features available on the peer's endpoint. Commonly, this refers to software packages that support peer networking activities, like games or other collaborative applications.
 * 
 * A peer application has a GUID representing a single specific application. When an application is registered for a peer, this GUID and the corresponding application can be made available to all trusted contacts of the peer, indicating the activities the peer can participate in. To deregister a peer application, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabunregisterapplication">PeerCollabUnregisterApplication</a> with this GUID.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_application
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_APPLICATION {
    #StructPack 8

    /**
     * The GUID value under which the application is registered with the local computer.
     */
    id : Guid

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains the application information in a member byte buffer. This information is available to anyone who can query for the local peer's member information. This data is limited to 16K.
     * @deprecated
     */
    data : PEER_DATA

    /**
     * Pointer to a zero-terminated Unicode string that contains an optional  description of the local application. This description is limited to 255 unicode characters.
     */
    pwzDescription : PWSTR

}
