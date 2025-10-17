#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INVOC.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class UNI_CODEPAGEINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwCodePage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {INVOC}
     */
    SelectSymbolSet{
        get {
            if(!this.HasProp("__SelectSymbolSet"))
                this.__SelectSymbolSet := INVOC(8, this)
            return this.__SelectSymbolSet
        }
    }

    /**
     * @type {INVOC}
     */
    UnSelectSymbolSet{
        get {
            if(!this.HasProp("__UnSelectSymbolSet"))
                this.__UnSelectSymbolSet := INVOC(16, this)
            return this.__UnSelectSymbolSet
        }
    }
}
