#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEKMSKEY extends Win32Struct
{
    static sizeof => 78

    static packingSize => 1

    /**
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwCompStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwVKEY {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwControl {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwNotUsed {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {String}
     */
    pwszDscr {
        get => StrGet(this.ptr + 16, 30, "UTF-16")
        set => StrPut(value, this.ptr + 16, 30, "UTF-16")
    }

    /**
     * @type {String}
     */
    pwszNoUse {
        get => StrGet(this.ptr + 16, 30, "UTF-16")
        set => StrPut(value, this.ptr + 16, 30, "UTF-16")
    }
}
