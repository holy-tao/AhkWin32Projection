#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IP6_ADDRESS structure stores an IPv6 address. (IP6_ADDRESS)
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-ip6_address
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class IP6_ADDRESS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * An IPv6 address of the form: "ABCD:EF01:2345:6789:ABCD:EF01:2345:6789"as defined in <a href="https://www.ietf.org/rfc/rfc4291.txt">RFC 4291</a>
     * @type {Array<UInt32>}
     */
    IP6Dword{
        get {
            if(!this.HasProp("__IP6DwordProxyArray"))
                this.__IP6DwordProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__IP6DwordProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    IP6Word{
        get {
            if(!this.HasProp("__IP6WordProxyArray"))
                this.__IP6WordProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
            return this.__IP6WordProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    IP6Byte{
        get {
            if(!this.HasProp("__IP6ByteProxyArray"))
                this.__IP6ByteProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__IP6ByteProxyArray
        }
    }
}
