#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTM_ENTITY_ID.ahk" { RTM_ENTITY_ID }

/**
 * The RTM_ENTITY_INFO structure is used to exchange client information with the routing table manager.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_entity_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_ENTITY_INFO {
    #StructPack 8

    /**
     * Specifies the instance of the routing table manager with which the client registered.
     */
    RtmInstanceId : UInt16

    /**
     * Specifies the address family to which the client belongs.
     */
    AddressFamily : UInt16

    /**
     * Specifies the identifier that uniquely identifies a client.
     */
    EntityId : RTM_ENTITY_ID

}
