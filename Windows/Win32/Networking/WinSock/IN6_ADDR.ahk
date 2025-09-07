#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IN6_ADDR structure specifies an IPv6 transport address.
 * @remarks
 * All members of the IN6_ADDR structure must be specified in network-byte-order (big-endian).
 * @see https://learn.microsoft.com/windows/win32/api/in6addr/ns-in6addr-in6_addr
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IN6_ADDR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Byte{
        get {
            if(!this.HasProp("__ByteProxyArray"))
                this.__ByteProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ByteProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    Word{
        get {
            if(!this.HasProp("__WordProxyArray"))
                this.__WordProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
            return this.__WordProxyArray
        }
    }
}
