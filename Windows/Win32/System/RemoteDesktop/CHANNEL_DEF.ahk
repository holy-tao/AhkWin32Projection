#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class CHANNEL_DEF extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 0, 7, "UTF-16")
        set => StrPut(value, this.ptr + 0, 7, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    options {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
