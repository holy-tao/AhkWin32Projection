#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class CHANNEL_DEF extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 0, 7, "UTF-8")
        set => StrPut(value, this.ptr + 0, 7, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    options {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
