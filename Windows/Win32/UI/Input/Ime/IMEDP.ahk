#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\IMEWRD.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEDP extends Win32Struct
{
    static sizeof => 92

    static packingSize => 1

    /**
     * @type {IMEWRD}
     */
    wrdModifier{
        get {
            if(!this.HasProp("__wrdModifier"))
                this.__wrdModifier := IMEWRD(this.ptr + 0)
            return this.__wrdModifier
        }
    }

    /**
     * @type {IMEWRD}
     */
    wrdModifiee{
        get {
            if(!this.HasProp("__wrdModifiee"))
                this.__wrdModifiee := IMEWRD(this.ptr + 44)
            return this.__wrdModifiee
        }
    }

    /**
     * @type {Integer}
     */
    relID {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }
}
