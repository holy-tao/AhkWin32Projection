#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_PRESENCE_STATUS.ahk" { PEER_PRESENCE_STATUS }

/**
 * The PEER_PRESENCE_INFO structure contains specific peer presence information.
 * @remarks
 * Peer "presence" is information about a specific peer's level of participation in a peer collaboration network, such as whether or not the peer has logged into or out of the peer collaboration network, or has set a specific status (for example, "Busy, "Away").
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_presence_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_PRESENCE_INFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_presence_status">PEER_PRESENCE_STATUS</a> enumeration value that indicates the current availability or level of participation by the peer in a peer collaboration network.
     * @deprecated
     */
    status : PEER_PRESENCE_STATUS

    /**
     * Zero-terminated Unicode string that contains a user- or application-defined message that expands upon the current status value. This string is limited to 255 characters.
     */
    pwzDescriptiveText : PWSTR

}
