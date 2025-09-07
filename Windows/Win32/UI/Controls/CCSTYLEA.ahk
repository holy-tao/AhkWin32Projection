#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class CCSTYLEA extends Win32Struct
{
    static sizeof => 268

    static packingSize => 4

    /**
     * @type {Integer}
     */
    flStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    flExtStyle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szText {
        get => StrGet(this.ptr + 8, 255, "UTF-8")
        set => StrPut(value, this.ptr + 8, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    lgid {
        get => NumGet(this, 264, "ushort")
        set => NumPut("ushort", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    wReserved1 {
        get => NumGet(this, 266, "ushort")
        set => NumPut("ushort", value, this, 266)
    }
}
