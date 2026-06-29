#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_CHANGE_TYPE.ahk" { PEER_CHANGE_TYPE }
#Import ".\PEER_PEOPLE_NEAR_ME.ahk" { PEER_PEOPLE_NEAR_ME }

/**
 * The PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA structure contains information returned when a PEER_EVENT_PEOPLE_NEAR_ME_CHANGED event is raised on a peer participating in a subnet-specific peer collaboration network.
 * @remarks
 * The information that can be changed in a peer contact include the endpoint's name or its associated IPv6 address. 
 * 
 *  If the <b>changeType</b> is set to PEER_CHANGE_ADDED and <b>pEndpoint</b> is set to <b>NULL</b>, then the local peer has signed in. Otherwise, if <b>changeType</b> is set to PEER_CHANGE_DELETEDimplies the local peer has signed out.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_people_near_me_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_change_type">PEER_CHANGE_TYPE</a> enumeration value that describes the type of change that occurred for a contact available on the local subnet.
     * @deprecated
     */
    changeType : PEER_CHANGE_TYPE

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_people_near_me">PEER_PEOPLE_NEAR_ME</a> structure that contains the peer endpoint information for the contact on the subnet that raised the change event.
     * @deprecated
     */
    pPeopleNearMe : PEER_PEOPLE_NEAR_ME.Ptr

}
