#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_NB extends Win32Struct
{
    static sizeof => 20

    static packingSize => 2

    /**
     * @type {Integer}
     */
    snb_family {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    snb_type {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<SByte>}
     */
    snb_name{
        get {
            if(!this.HasProp("__snb_nameProxyArray"))
                this.__snb_nameProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__snb_nameProxyArray
        }
    }
}
