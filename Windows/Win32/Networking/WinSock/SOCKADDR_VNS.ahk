#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_VNS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * @type {Integer}
     */
    sin_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    net_address{
        get {
            if(!this.HasProp("__net_addressProxyArray"))
                this.__net_addressProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__net_addressProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    subnet_addr{
        get {
            if(!this.HasProp("__subnet_addrProxyArray"))
                this.__subnet_addrProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__subnet_addrProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    port{
        get {
            if(!this.HasProp("__portProxyArray"))
                this.__portProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__portProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    hops {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Array<Byte>}
     */
    filler{
        get {
            if(!this.HasProp("__fillerProxyArray"))
                this.__fillerProxyArray := Win32FixedArray(this.ptr + 11, 1, Primitive, "char")
            return this.__fillerProxyArray
        }
    }
}
