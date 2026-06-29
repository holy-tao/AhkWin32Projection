#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_CONTACT.ahk" { PEER_CONTACT }
#Import ".\PEER_CHANGE_TYPE.ahk" { PEER_CHANGE_TYPE }

/**
 * The PEER_EVENT_WATCHLIST_CHANGED_DATA structure contains information returned when a PEER_EVENT_WATCHLIST_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @remarks
 * The PEER_EVENT_WATCHLIST_CHANGED event is raised when the watch list is changed. The watch list is composed of the contacts that have <b>fWatch</b> set to true. If a new contact is added with <b>fWatch</b> set to true, or if an existing contact's <b>fWatch</b> is changed to true, the <b>changeType</b> member is set to PEER_CHANGE_ADDED. If <b>fWatch</b> is changed to false or if a contact is deleted, <b>changeType</b> is set to PEER_CHANGE_DELETED. 
 * 
 * The p2phost.exe service must running to receive this event. P2phost.exe is launched when an application calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterevent">PeerCollabRegisterEvent</a> on this event.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_watchlist_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_WATCHLIST_CHANGED_DATA {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains information about the peer contact in the watchlist whose change raised the event.
     * @deprecated
     */
    pContact : PEER_CONTACT.Ptr

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_change_type">PEER_CHANGE_TYPE</a> enumeration value that specifies the type of change that occurred in the peer's watchlist.
     * @deprecated
     */
    changeType : PEER_CHANGE_TYPE

}
