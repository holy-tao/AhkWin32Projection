#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IP6_ADDRESS structure stores an IPv6 address.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-ip6_address
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class IP6_ADDRESS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * 
     * @type {Array<UInt64>}
     */
    IP6Qword{
        get {
            if(!this.HasProp("__IP6QwordProxyArray"))
                this.__IP6QwordProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "uint")
            return this.__IP6QwordProxyArray
        }
    }

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
                this.__IP6WordProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "ushort")
            return this.__IP6WordProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    IP6Byte{
        get {
            if(!this.HasProp("__IP6ByteProxyArray"))
                this.__IP6ByteProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__IP6ByteProxyArray
        }
    }
}
