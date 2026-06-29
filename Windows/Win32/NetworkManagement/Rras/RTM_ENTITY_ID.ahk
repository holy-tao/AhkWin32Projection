#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RTM_ENTITY_ID structure is used to uniquely identify a client to the routing table manager. The protocol identifier and the instance identifier are the values that are used to uniquely identify a client.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_entity_id
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_ENTITY_ID {
    #StructPack 8

    EntityProtocolId : UInt32

    EntityInstanceId : UInt32

    static __New() {
        DefineProp(this.Prototype, 'EntityId', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
