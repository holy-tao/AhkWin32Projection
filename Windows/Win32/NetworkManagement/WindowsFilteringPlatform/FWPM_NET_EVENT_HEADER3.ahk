#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\FWP_AF.ahk" { FWP_AF }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains information common to all events. (FWPM_NET_EVENT_HEADER3)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_header3
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_HEADER3 {
    #StructPack 8

    /**
     * Time that the event occurred.
     */
    timeStamp : FILETIME

    /**
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
     * The IP version being used.
     */
    ipVersion : FWP_IP_VERSION

    /**
     * The IP protocol specified as an IPPROTO value. See the [socket](../winsock2/nf-winsock2-socket.md) reference topic for more information on possible protocol values.
     */
    ipProtocol : Int8

    localAddrV4 : UInt32

    remoteAddrV4 : UInt32

    /**
     * The local port.
     */
    localPort : UInt16

    /**
     * The remote port.
     */
    remotePort : UInt16

    /**
     * The IPv6 scope ID.
     */
    scopeId : UInt32

    /**
     * The application ID of the local application associated with the event.
     */
    appId : FWP_BYTE_BLOB

    /**
     * The user ID corresponding to the traffic.
     */
    userId : SID.Ptr

    /**
     * A superset of non-Internet protocols.
     * 
     * Available when **ipVersion** is **FWP_IP_VERSION_NONE**.
     */
    addressFamily : FWP_AF

    /**
     * The security identifier (SID) representing the package identifier (also referred to as the app container SID) intending to send or receive the network traffic.
     */
    packageSid : SID.Ptr

    /**
     * The enterprise identifier for use with enterprise data protection (EDP).
     */
    enterpriseId : PWSTR

    /**
     * The policy flags for EDP.
     */
    policyFlags : Int64

    /**
     * The EDP remote server used for name-based policy.
     */
    effectiveName : FWP_BYTE_BLOB

    static __New() {
        DefineProp(this.Prototype, 'localAddrV6', { type: FWP_BYTE_ARRAY16, offset: 20 })
        DefineProp(this.Prototype, 'remoteAddrV6', { type: FWP_BYTE_ARRAY16, offset: 36 })
        this.DeleteProp("__New")
    }
}
