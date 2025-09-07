#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPTINFO extends Win32Struct
{
    static sizeof => 232

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ScriptId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uiCodePage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    wszDescription {
        get => StrGet(this.ptr + 8, 47, "UTF-16")
        set => StrPut(value, this.ptr + 8, 47, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszFixedWidthFont {
        get => StrGet(this.ptr + 104, 31, "UTF-16")
        set => StrPut(value, this.ptr + 104, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszProportionalFont {
        get => StrGet(this.ptr + 168, 31, "UTF-16")
        set => StrPut(value, this.ptr + 168, 31, "UTF-16")
    }
}
