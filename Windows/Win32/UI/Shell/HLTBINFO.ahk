#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class HLTBINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uDockType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {RECT}
     */
    rcTbPos{
        get {
            if(!this.HasProp("__rcTbPos"))
                this.__rcTbPos := RECT(8, this)
            return this.__rcTbPos
        }
    }
}
