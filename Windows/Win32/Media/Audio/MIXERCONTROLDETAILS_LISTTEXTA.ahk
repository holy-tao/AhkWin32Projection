#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIXERCONTROLDETAILS_LISTTEXTA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwParam1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwParam2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 8, 63, "UTF-8")
        set => StrPut(value, this.ptr + 8, 63, "UTF-8")
    }
}
