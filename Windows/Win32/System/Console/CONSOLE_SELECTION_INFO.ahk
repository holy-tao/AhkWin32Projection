#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk
#Include .\SMALL_RECT.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_SELECTION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {COORD}
     */
    dwSelectionAnchor{
        get {
            if(!this.HasProp("__dwSelectionAnchor"))
                this.__dwSelectionAnchor := COORD(4, this)
            return this.__dwSelectionAnchor
        }
    }

    /**
     * @type {SMALL_RECT}
     */
    srSelection{
        get {
            if(!this.HasProp("__srSelection"))
                this.__srSelection := SMALL_RECT(8, this)
            return this.__srSelection
        }
    }
}
