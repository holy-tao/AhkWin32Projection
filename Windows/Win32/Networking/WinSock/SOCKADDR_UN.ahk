#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_UN extends Win32Struct
{
    static sizeof => 110

    static packingSize => 2

    /**
     * @type {Integer}
     */
    sun_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    sun_path{
        get {
            if(!this.HasProp("__sun_pathProxyArray"))
                this.__sun_pathProxyArray := Win32FixedArray(this.ptr + 2, 108, Primitive, "char")
            return this.__sun_pathProxyArray
        }
    }
}
