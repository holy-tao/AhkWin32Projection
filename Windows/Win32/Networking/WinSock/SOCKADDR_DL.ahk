#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_DL extends Win32Struct
{
    static sizeof => 14

    static packingSize => 2

    /**
     * @type {Integer}
     */
    sdl_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    sdl_data{
        get {
            if(!this.HasProp("__sdl_dataProxyArray"))
                this.__sdl_dataProxyArray := Win32FixedArray(this.ptr + 2, 8, Primitive, "char")
            return this.__sdl_dataProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    sdl_zero{
        get {
            if(!this.HasProp("__sdl_zeroProxyArray"))
                this.__sdl_zeroProxyArray := Win32FixedArray(this.ptr + 10, 4, Primitive, "char")
            return this.__sdl_zeroProxyArray
        }
    }
}
