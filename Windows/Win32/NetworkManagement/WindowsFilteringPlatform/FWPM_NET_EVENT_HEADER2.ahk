#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\FWP_AF.ahk" { FWP_AF }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains information common to all events. (FWPM_NET_EVENT_HEADER2)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_header2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_HEADER2 {
    #StructPack 8

    /**
     * Type: **[FILETIME](../minwinbase/ns-minwinbase-filetime.md)**
     * 
     * Time that the event occurred.
     */
    timeStamp : FILETIME

    /**
     * Type: **UINT32**
     * 
     * Flags indicating which of the following members are set.  Unused fields must be zero-initialized.
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
     * | FWPM_NET_EVENT_FLAG_REAUTH_REASON_SET | Indicates an existing connection was reauthorized. |
     * | FWPM_NET_EVENT_FLAG_PACKAGE_ID_SET | The **packageSid** member is set. |
     */
    flags : UInt32

    /**
     * Type: **[FWP_IP_VERSION](../fwptypes/ne-fwptypes-fwp_ip_version.md)**
     * 
     * The IP version being used.
     */
    ipVersion : FWP_IP_VERSION

    /**
     * Type: **UINT8**
     * 
     * The IP protocol specified as an IPPROTO value. See the [socket](../winsock2/nf-winsock2-socket.md) reference topic for more information on possible protocol values.
     */
    ipProtocol : Int8

    localAddrV4 : UInt32

    remoteAddrV4 : UInt32

    /**
     * Type: **UINT16**
     * 
     * The local port.
     */
    localPort : UInt16

    /**
     * Type: **UINT16**
     * 
     * The remote port.
     */
    remotePort : UInt16

    /**
     * Type: **UINT32**
     * 
     * The IPv6 scope ID.
     */
    scopeId : UInt32

    /**
     * Type: **[FWP_BYTE_BLOB](../fwptypes/ns-fwptypes-fwp_byte_blob.md)**
     * 
     * The application ID of the local application associated with the event.
     */
    appId : FWP_BYTE_BLOB

    /**
     * Type: **SID***
     * 
     * The user ID corresponding to the traffic.
     */
    userId : SID.Ptr

    /**
     * Type: **[FWP_AF](../fwptypes/ne-fwptypes-fwp_af.md)**
     * 
     * A superset of non-Internet protocols.
     * 
     * Available when **ipVersion** is **FWP_IP_VERSION_NONE**.
     */
    addressFamily : FWP_AF

    /**
     * Type: **SID***
     * 
     * The security identifier (SID) representing the package identifier (also referred to as the app container SID) intending to send or receive the network traffic.
     */
    packageSid : SID.Ptr

    static __New() {
        DefineProp(this.Prototype, 'localAddrV6', { type: FWP_BYTE_ARRAY16, offset: 20 })
        DefineProp(this.Prototype, 'remoteAddrV6', { type: FWP_BYTE_ARRAY16, offset: 36 })
        this.DeleteProp("__New")
    }
}
