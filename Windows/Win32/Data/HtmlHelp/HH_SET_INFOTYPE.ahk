#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HH_SET_INFOTYPE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    pszCatName{
        get {
            if(!this.HasProp("__pszCatName"))
                this.__pszCatName := PSTR(this.ptr + 8)
            return this.__pszCatName
        }
    }

    /**
     * @type {PSTR}
     */
    pszInfoTypeName{
        get {
            if(!this.HasProp("__pszInfoTypeName"))
                this.__pszInfoTypeName := PSTR(this.ptr + 16)
            return this.__pszInfoTypeName
        }
    }
}
