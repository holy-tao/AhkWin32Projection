#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPPHRASEREPLACEMENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    bDisplayAttributes {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszReplacementText{
        get {
            if(!this.HasProp("__pszReplacementText"))
                this.__pszReplacementText := PWSTR(this.ptr + 8)
            return this.__pszReplacementText
        }
    }

    /**
     * @type {Integer}
     */
    ulFirstElement {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulCountOfElements {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
