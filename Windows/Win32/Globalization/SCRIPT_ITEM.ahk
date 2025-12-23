#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\SCRIPT_STATE.ahk
#Include .\SCRIPT_ANALYSIS.ahk

/**
 * Contains a script item, including a SCRIPT_ANALYSIS structure with the string offset of the first character of the item.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_item
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_ITEM extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Offset from the beginning of the itemized string to the first character of the item, counted in Unicode code points (WCHAR values).
     * @type {Integer}
     */
    iCharPos {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_analysis">SCRIPT_ANALYSIS</a> structure containing the analysis of the item.
     * @type {SCRIPT_ANALYSIS}
     */
    a{
        get {
            if(!this.HasProp("__a"))
                this.__a := SCRIPT_ANALYSIS(4, this)
            return this.__a
        }
    }
}
