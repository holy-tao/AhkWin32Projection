#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class COLUMNSTATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cPropCount {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cPropsLoaded {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
