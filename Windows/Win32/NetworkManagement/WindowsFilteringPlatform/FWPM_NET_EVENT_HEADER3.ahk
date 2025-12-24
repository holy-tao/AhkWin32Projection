#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Contains information common to all events. (FWPM_NET_EVENT_HEADER3)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_header3
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_HEADER3 extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Time that the event occurred.
     * @type {FILETIME}
     */
    timeStamp{
        get {
            if(!this.HasProp("__timeStamp"))
                this.__timeStamp := FILETIME(0, this)
            return this.__timeStamp
        }
    }

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
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The IP version being used.
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The IP protocol specified as an IPPROTO value. See the [socket](../winsock2/nf-winsock2-socket.md) reference topic for more information on possible protocol values.
     * @type {Integer}
     */
    ipProtocol {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    localAddrV4 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {FWP_BYTE_ARRAY16}
     */
    localAddrV6{
        get {
            if(!this.HasProp("__localAddrV6"))
                this.__localAddrV6 := FWP_BYTE_ARRAY16(20, this)
            return this.__localAddrV6
        }
    }

    /**
     * @type {Integer}
     */
    remoteAddrV4 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {FWP_BYTE_ARRAY16}
     */
    remoteAddrV6{
        get {
            if(!this.HasProp("__remoteAddrV6"))
                this.__remoteAddrV6 := FWP_BYTE_ARRAY16(36, this)
            return this.__remoteAddrV6
        }
    }

    /**
     * The local port.
     * @type {Integer}
     */
    localPort {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * The remote port.
     * @type {Integer}
     */
    remotePort {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * The IPv6 scope ID.
     * @type {Integer}
     */
    scopeId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The application ID of the local application associated with the event.
     * @type {FWP_BYTE_BLOB}
     */
    appId{
        get {
            if(!this.HasProp("__appId"))
                this.__appId := FWP_BYTE_BLOB(64, this)
            return this.__appId
        }
    }

    /**
     * The user ID corresponding to the traffic.
     * @type {Pointer<SID>}
     */
    userId {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A superset of non-Internet protocols.
     * 
     * Available when **ipVersion** is **FWP_IP_VERSION_NONE**.
     * @type {Integer}
     */
    addressFamily {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * The security identifier (SID) representing the package identifier (also referred to as the app container SID) intending to send or receive the network traffic.
     * @type {Pointer<SID>}
     */
    packageSid {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * The enterprise identifier for use with enterprise data protection (EDP).
     * @type {PWSTR}
     */
    enterpriseId {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * The policy flags for EDP.
     * @type {Integer}
     */
    policyFlags {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The EDP remote server used for name-based policy.
     * @type {FWP_BYTE_BLOB}
     */
    effectiveName{
        get {
            if(!this.HasProp("__effectiveName"))
                this.__effectiveName := FWP_BYTE_BLOB(120, this)
            return this.__effectiveName
        }
    }
}
