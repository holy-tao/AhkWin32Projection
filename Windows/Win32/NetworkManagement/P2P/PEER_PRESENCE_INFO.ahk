#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_PRESENCE_INFO structure contains specific peer presence information.
 * @remarks
 * 
  * Peer "presence" is information about a specific peer's level of participation in a peer collaboration network, such as whether or not the peer has logged into or out of the peer collaboration network, or has set a specific status (for example, "Busy, "Away").
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_presence_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_PRESENCE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_presence_status">PEER_PRESENCE_STATUS</a> enumeration value that indicates the current availability or level of participation by the peer in a peer collaboration network.
     * @deprecated
     * @type {Integer}
     */
    status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Zero-terminated Unicode string that contains a user- or application-defined message that expands upon the current status value. This string is limited to 255 characters.
     * @type {Pointer<Char>}
     */
    pwzDescriptiveText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
