#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMEWRD.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEDP extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {IMEWRD}
     */
    wrdModifier{
        get {
            if(!this.HasProp("__wrdModifier"))
                this.__wrdModifier := IMEWRD(0, this)
            return this.__wrdModifier
        }
    }

    /**
     * @type {IMEWRD}
     */
    wrdModifiee{
        get {
            if(!this.HasProp("__wrdModifiee"))
                this.__wrdModifiee := IMEWRD(48, this)
            return this.__wrdModifiee
        }
    }

    /**
     * @type {Integer}
     */
    relID {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }
}
