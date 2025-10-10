#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include ..\..\Networking\WinSock\SOCKET_ADDRESS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADAPTER_ADDRESSES_LH extends Win32Struct
{
    static sizeof => 448

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IfIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<IP_ADAPTER_ADDRESSES_LH>}
     */
    Next {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Byte>}
     */
    AdapterName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IP_ADAPTER_UNICAST_ADDRESS_LH>}
     */
    FirstUnicastAddress {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<IP_ADAPTER_ANYCAST_ADDRESS_XP>}
     */
    FirstAnycastAddress {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<IP_ADAPTER_MULTICAST_ADDRESS_XP>}
     */
    FirstMulticastAddress {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<IP_ADAPTER_DNS_SERVER_ADDRESS_XP>}
     */
    FirstDnsServerAddress {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Char>}
     */
    DnsSuffix {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Char>}
     */
    Description {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Char>}
     */
    FriendlyName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Array<Byte>}
     */
    PhysicalAddress{
        get {
            if(!this.HasProp("__PhysicalAddressProxyArray"))
                this.__PhysicalAddressProxyArray := Win32FixedArray(this.ptr + 80, 8, Primitive, "char")
            return this.__PhysicalAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    PhysicalAddressLength {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    Mtu {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    IfType {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    OperStatus {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    Ipv6IfIndex {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Array<UInt32>}
     */
    ZoneIndices{
        get {
            if(!this.HasProp("__ZoneIndicesProxyArray"))
                this.__ZoneIndicesProxyArray := Win32FixedArray(this.ptr + 112, 16, Primitive, "uint")
            return this.__ZoneIndicesProxyArray
        }
    }

    /**
     * @type {Pointer<IP_ADAPTER_PREFIX_XP>}
     */
    FirstPrefix {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    TransmitLinkSpeed {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    ReceiveLinkSpeed {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Pointer<IP_ADAPTER_WINS_SERVER_ADDRESS_LH>}
     */
    FirstWinsServerAddress {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<IP_ADAPTER_GATEWAY_ADDRESS_LH>}
     */
    FirstGatewayAddress {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    Ipv4Metric {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    Ipv6Metric {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {NET_LUID_LH}
     */
    Luid{
        get {
            if(!this.HasProp("__Luid"))
                this.__Luid := NET_LUID_LH(this.ptr + 224)
            return this.__Luid
        }
    }

    /**
     * @type {SOCKET_ADDRESS}
     */
    Dhcpv4Server{
        get {
            if(!this.HasProp("__Dhcpv4Server"))
                this.__Dhcpv4Server := SOCKET_ADDRESS(this.ptr + 240)
            return this.__Dhcpv4Server
        }
    }

    /**
     * @type {Integer}
     */
    CompartmentId {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Pointer<Guid>}
     */
    NetworkGuid {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    ConnectionType {
        get => NumGet(this, 272, "int")
        set => NumPut("int", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    TunnelType {
        get => NumGet(this, 276, "int")
        set => NumPut("int", value, this, 276)
    }

    /**
     * @type {SOCKET_ADDRESS}
     */
    Dhcpv6Server{
        get {
            if(!this.HasProp("__Dhcpv6Server"))
                this.__Dhcpv6Server := SOCKET_ADDRESS(this.ptr + 280)
            return this.__Dhcpv6Server
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Dhcpv6ClientDuid{
        get {
            if(!this.HasProp("__Dhcpv6ClientDuidProxyArray"))
                this.__Dhcpv6ClientDuidProxyArray := Win32FixedArray(this.ptr + 296, 130, Primitive, "char")
            return this.__Dhcpv6ClientDuidProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Dhcpv6ClientDuidLength {
        get => NumGet(this, 428, "uint")
        set => NumPut("uint", value, this, 428)
    }

    /**
     * @type {Integer}
     */
    Dhcpv6Iaid {
        get => NumGet(this, 432, "uint")
        set => NumPut("uint", value, this, 432)
    }

    /**
     * @type {Pointer<IP_ADAPTER_DNS_SUFFIX>}
     */
    FirstDnsSuffix {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }
}
