#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IN6_ADDR structure specifies an IPv6 transport address.
 * @remarks
 * 
 * All members of the IN6_ADDR structure must be specified in network-byte-order (big-endian).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//in6addr/ns-in6addr-in6_addr
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IN6_ADDR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 16
        static packingSize => 2

        /**
         * @type {Array<Byte>}
         */
        Byte{
            get {
                if(!this.HasProp("__ByteProxyArray"))
                    this.__ByteProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
                return this.__ByteProxyArray
            }
        }
    
        /**
         * @type {Array<UInt16>}
         */
        Word{
            get {
                if(!this.HasProp("__WordProxyArray"))
                    this.__WordProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "ushort")
                return this.__WordProxyArray
            }
        }
    
    }

    /**
     * A union that contains the following different representations of the IPv6 transport
     *      address:
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(0, this)
            return this.__u
        }
    }
}
