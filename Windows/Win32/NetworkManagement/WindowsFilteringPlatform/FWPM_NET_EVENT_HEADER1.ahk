#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\FWP_AF.ahk" { FWP_AF }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Information common to all events. Reserved.
 * @remarks
 * The unnamed struct specifies details related to Ethernet traffic. It's available when **addressFamily** is **FWP_AF_ETHER**.
 * 
 * This structure is reserved for system use. [FWPM_NET_EVENT_HEADER2](ns-fwpmtypes-fwpm_net_event_header2.md) should be used in place of **FWPM_NET_EVENT_HEADER1**.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_header1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_HEADER1 {
    #StructPack 8

    /**
     * A [FILETIME](../minwinbase/ns-minwinbase-filetime.md) structure that specifies the time the event occurred.
     */
    timeStamp : FILETIME

    /**
     * Flags indicating which of the following members are set. Unused fields must be zero-initialized.
     * 
     * | Net event flag | Meaning |
     * | -------------- | ------- |
     * | FWPM_NET_EVENT_FLAG_IP_PROTOCOL_SET | The **ipProtocol** member is set. |
     * | FWPM_NET_EVENT_FLAG_LOCAL_ADDR_SET | Either the **localAddrV4** member or the **localAddrV6** member is set. If this flag is present,  **FWPM_NET_EVENT_FLAG_IP_VERSION_SET** must also be present. |
     * | FWPM_NET_EVENT_FLAG_REMOTE_ADDR_SET | Either the **remoteAddrV4** member of the **remoteAddrV6** field is set. If this flag is present,  **FWPM_NET_EVENT_FLAG_IP_VERSION_SET** must also be present. |
     * | FWPM_NET_EVENT_FLAG_LOCAL_PORT_SET | The **localPort** member is set. |
     * | FWPM_NET_EVENT_FLAG_REMOTE_PORT_SET | The **remotePort** member is set. |
     * | FWPM_NET_EVENT_FLAG_APP_ID_SET | The **appId** member is set. |
     * | FWPM_NET_EVENT_FLAG_USER_ID_SET | The **userId** member is set. |
     * | FWPM_NET_EVENT_FLAG_SCOPE_ID_SET | The **scopeId** member is set. |
     * | FWPM_NET_EVENT_FLAG_IP_VERSION_SET | The **ipVersion** member is set. |
     */
    flags : UInt32

    /**
     * An [FWP_IP_VERSION](../fwptypes/ne-fwptypes-fwp_ip_version.md) value that specifies the IP version being used.
     */
    ipVersion : FWP_IP_VERSION

    /**
     * IP protocol specified as an IPPROTO value. See the [socket](../winsock2/nf-winsock2-socket.md) reference topic for more information on possible protocol values.
     */
    ipProtocol : Int8

    localAddrV4 : UInt32

    remoteAddrV4 : UInt32

    /**
     * Specifies a local port.
     */
    localPort : UInt16

    /**
     * Specifies a remote port.
     */
    remotePort : UInt16

    /**
     * IPv6 scope ID.
     */
    scopeId : UInt32

    /**
     * An [FWP_BYTE_BLOB](../fwptypes/ns-fwptypes-fwp_byte_blob.md) that specifies the application ID of the local application associated with the event.
     */
    appId : FWP_BYTE_BLOB

    /**
     * Contains a user ID that corresponds to the traffic.
     */
    userId : SID.Ptr

    reserved1 : FWP_AF

    reserved2 : FWP_BYTE_ARRAY6

    reserved3 : FWP_BYTE_ARRAY6

    reserved4 : UInt32

    reserved5 : UInt32

    reserved6 : UInt16

    reserved7 : UInt32

    reserved8 : UInt32

    reserved9 : UInt16

    reserved10 : Int64

    static __New() {
        DefineProp(this.Prototype, 'localAddrV6', { type: FWP_BYTE_ARRAY16, offset: 20 })
        DefineProp(this.Prototype, 'remoteAddrV6', { type: FWP_BYTE_ARRAY16, offset: 36 })
        this.DeleteProp("__New")
    }
}
