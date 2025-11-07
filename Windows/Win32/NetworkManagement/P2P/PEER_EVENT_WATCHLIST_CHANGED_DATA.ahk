#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_EVENT_WATCHLIST_CHANGED_DATA structure contains information returned when a PEER_EVENT_WATCHLIST_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @remarks
 * 
 * The PEER_EVENT_WATCHLIST_CHANGED event is raised when the watch list is changed. The watch list is composed of the contacts that have <b>fWatch</b> set to true. If a new contact is added with <b>fWatch</b> set to true, or if an existing contact's <b>fWatch</b> is changed to true, the <b>changeType</b> member is set to PEER_CHANGE_ADDED. If <b>fWatch</b> is changed to false or if a contact is deleted, <b>changeType</b> is set to PEER_CHANGE_DELETED. 
 * 
 * The p2phost.exe service must running to receive this event. P2phost.exe is launched when an application calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterevent">PeerCollabRegisterEvent</a> on this event.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_event_watchlist_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_EVENT_WATCHLIST_CHANGED_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains information about the peer contact in the watchlist whose change raised the event.
     * @deprecated
     * @type {Pointer<PEER_CONTACT>}
     */
    pContact {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_change_type">PEER_CHANGE_TYPE</a> enumeration value that specifies the type of change that occurred in the peer's watchlist.
     * @deprecated
     * @type {Integer}
     */
    changeType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
