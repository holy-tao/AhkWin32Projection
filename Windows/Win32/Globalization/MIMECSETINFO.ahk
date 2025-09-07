#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MIMECSETINFO extends Win32Struct
{
    static sizeof => 108

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uiCodePage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uiInternetEncoding {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    wszCharset {
        get => StrGet(this.ptr + 8, 49, "UTF-16")
        set => StrPut(value, this.ptr + 8, 49, "UTF-16")
    }
}
