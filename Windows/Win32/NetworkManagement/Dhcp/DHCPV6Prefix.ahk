#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCPV6Prefix contains an IPv6 prefix.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefix
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6Prefix extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * 128 bit prefix.
     * @type {Array<Byte>}
     */
    prefix{
        get {
            if(!this.HasProp("__prefixProxyArray"))
                this.__prefixProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__prefixProxyArray
        }
    }

    /**
     * Length of the prefix.
     * @type {Integer}
     */
    prefixLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Preferred lifetime of the prefix, in seconds.
     * @type {Integer}
     */
    preferredLifeTime {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The valid lifetime of the prefix in seconds.
     * @type {Integer}
     */
    validLifeTime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The status code returned.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
