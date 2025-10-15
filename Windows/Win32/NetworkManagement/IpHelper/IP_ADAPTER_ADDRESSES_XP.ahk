#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_ADAPTER_ADDRESSES_XP extends Win32Struct
{
    static sizeof => 184

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
     * @type {Pointer<IP_ADAPTER_ADDRESSES_XP>}
     */
    Next {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    AdapterName{
        get {
            if(!this.HasProp("__AdapterName"))
                this.__AdapterName := PSTR(this.ptr + 16)
            return this.__AdapterName
        }
    }

    /**
     * @type {Pointer<IP_ADAPTER_UNICAST_ADDRESS_XP>}
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
     * @type {PWSTR}
     */
    DnsSuffix{
        get {
            if(!this.HasProp("__DnsSuffix"))
                this.__DnsSuffix := PWSTR(this.ptr + 56)
            return this.__DnsSuffix
        }
    }

    /**
     * @type {PWSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PWSTR(this.ptr + 64)
            return this.__Description
        }
    }

    /**
     * @type {PWSTR}
     */
    FriendlyName{
        get {
            if(!this.HasProp("__FriendlyName"))
                this.__FriendlyName := PWSTR(this.ptr + 72)
            return this.__FriendlyName
        }
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
}
