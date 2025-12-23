#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the result of an IPv6 control protocol negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_ipv6_cp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_IPV6_CP_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * The version of the <b>PPP_IPV6_CP_INFO</b> structure used.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of this <b>PPP_IPV6_CP_INFO</b> structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the 64 bit interface identifier of the IPv6 server interface.
     * @type {Array<Byte>}
     */
    bInterfaceIdentifier{
        get {
            if(!this.HasProp("__bInterfaceIdentifierProxyArray"))
                this.__bInterfaceIdentifierProxyArray := Win32FixedArray(this.ptr + 12, 8, Primitive, "char")
            return this.__bInterfaceIdentifierProxyArray
        }
    }

    /**
     * Specifies the 64 bit interface identifier of the IPv6 client interface.
     * @type {Array<Byte>}
     */
    bRemoteInterfaceIdentifier{
        get {
            if(!this.HasProp("__bRemoteInterfaceIdentifierProxyArray"))
                this.__bRemoteInterfaceIdentifierProxyArray := Win32FixedArray(this.ptr + 20, 8, Primitive, "char")
            return this.__bRemoteInterfaceIdentifierProxyArray
        }
    }

    /**
     * Reserved. Must be set to 0.
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved. Must be set to 0.
     * @type {Integer}
     */
    dwRemoteOptions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the address prefix of the IPv6 client interface.
     * @type {Array<Byte>}
     */
    bPrefix{
        get {
            if(!this.HasProp("__bPrefixProxyArray"))
                this.__bPrefixProxyArray := Win32FixedArray(this.ptr + 36, 8, Primitive, "char")
            return this.__bPrefixProxyArray
        }
    }

    /**
     * The length, in bits, of the address prefix.
     * @type {Integer}
     */
    dwPrefixLength {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
