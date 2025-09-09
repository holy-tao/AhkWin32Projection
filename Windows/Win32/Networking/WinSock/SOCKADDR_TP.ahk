#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_TP extends Win32Struct
{
    static sizeof => 72

    static packingSize => 2

    /**
     * @type {Integer}
     */
    tp_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    tp_addr_type {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    tp_taddr_len {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    tp_tsel_len {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Array<Byte>}
     */
    tp_addr{
        get {
            if(!this.HasProp("__tp_addrProxyArray"))
                this.__tp_addrProxyArray := Win32FixedArray(this.ptr + 8, 64, Primitive, "char")
            return this.__tp_addrProxyArray
        }
    }
}
