#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset ANSI
 */
class NS_INFOA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwNameSpace {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwNameSpaceFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PSTR}
     */
    lpNameSpace{
        get {
            if(!this.HasProp("__lpNameSpace"))
                this.__lpNameSpace := PSTR(this.ptr + 8)
            return this.__lpNameSpace
        }
    }
}
