#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\FWP_BYTE_ARRAY6.ahk

/**
 * Information common to all events. Reserved.
 * @remarks
 * The unnamed struct specifies details related to Ethernet traffic. It's available when **addressFamily** is **FWP_AF_ETHER**.
  * 
  * This structure is reserved for system use. [FWPM_NET_EVENT_HEADER2](ns-fwpmtypes-fwpm_net_event_header2.md) should be used in place of **FWPM_NET_EVENT_HEADER1**.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_header1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_HEADER1 extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * A [FILETIME](../minwinbase/ns-minwinbase-filetime.md) structure that specifies the time the event occurred.
     * @type {FILETIME}
     */
    timeStamp{
        get {
            if(!this.HasProp("__timeStamp"))
                this.__timeStamp := FILETIME(this.ptr + 0)
            return this.__timeStamp
        }
    }

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
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An [FWP_IP_VERSION](../fwptypes/ne-fwptypes-fwp_ip_version.md) value that specifies the IP version being used.
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * IP protocol specified as an IPPROTO value. See the [socket](../winsock2/nf-winsock2-socket.md) reference topic for more information on possible protocol values.
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
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {FWP_BYTE_ARRAY16}
     */
    localAddrV6{
        get {
            if(!this.HasProp("__localAddrV6"))
                this.__localAddrV6 := FWP_BYTE_ARRAY16(this.ptr + 24)
            return this.__localAddrV6
        }
    }

    /**
     * @type {Integer}
     */
    remoteAddrV4 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {FWP_BYTE_ARRAY16}
     */
    remoteAddrV6{
        get {
            if(!this.HasProp("__remoteAddrV6"))
                this.__remoteAddrV6 := FWP_BYTE_ARRAY16(this.ptr + 40)
            return this.__remoteAddrV6
        }
    }

    /**
     * Specifies a local port.
     * @type {Integer}
     */
    localPort {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * Specifies a remote port.
     * @type {Integer}
     */
    remotePort {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * IPv6 scope ID.
     * @type {Integer}
     */
    scopeId {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * An [FWP_BYTE_BLOB](../fwptypes/ns-fwptypes-fwp_byte_blob.md) that specifies the application ID of the local application associated with the event.
     * @type {FWP_BYTE_BLOB}
     */
    appId{
        get {
            if(!this.HasProp("__appId"))
                this.__appId := FWP_BYTE_BLOB(this.ptr + 64)
            return this.__appId
        }
    }

    /**
     * Contains a user ID that corresponds to the traffic.
     * @type {Pointer<SID>}
     */
    userId {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {FWP_BYTE_ARRAY6}
     */
    reserved2{
        get {
            if(!this.HasProp("__reserved2"))
                this.__reserved2 := FWP_BYTE_ARRAY6(this.ptr + 96)
            return this.__reserved2
        }
    }

    /**
     * @type {FWP_BYTE_ARRAY6}
     */
    reserved3{
        get {
            if(!this.HasProp("__reserved3"))
                this.__reserved3 := FWP_BYTE_ARRAY6(this.ptr + 102)
            return this.__reserved3
        }
    }

    /**
     * @type {Integer}
     */
    reserved4 {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    reserved5 {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    reserved6 {
        get => NumGet(this, 116, "ushort")
        set => NumPut("ushort", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    reserved7 {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    reserved8 {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    reserved9 {
        get => NumGet(this, 128, "ushort")
        set => NumPut("ushort", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    reserved10 {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
