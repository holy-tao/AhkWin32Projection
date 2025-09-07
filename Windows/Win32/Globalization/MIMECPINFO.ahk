#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MIMECPINFO extends Win32Struct
{
    static sizeof => 572

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uiCodePage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uiFamilyCodePage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    wszDescription {
        get => StrGet(this.ptr + 12, 63, "UTF-16")
        set => StrPut(value, this.ptr + 12, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszWebCharset {
        get => StrGet(this.ptr + 140, 49, "UTF-16")
        set => StrPut(value, this.ptr + 140, 49, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszHeaderCharset {
        get => StrGet(this.ptr + 240, 49, "UTF-16")
        set => StrPut(value, this.ptr + 240, 49, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszBodyCharset {
        get => StrGet(this.ptr + 340, 49, "UTF-16")
        set => StrPut(value, this.ptr + 340, 49, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszFixedWidthFont {
        get => StrGet(this.ptr + 440, 31, "UTF-16")
        set => StrPut(value, this.ptr + 440, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszProportionalFont {
        get => StrGet(this.ptr + 504, 31, "UTF-16")
        set => StrPut(value, this.ptr + 504, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    bGDICharset {
        get => NumGet(this, 568, "char")
        set => NumPut("char", value, this, 568)
    }
}
