#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HH_GLOBAL_PROPERTY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {VARIANT}
     */
    var{
        get {
            if(!this.HasProp("__var"))
                this.__var := VARIANT(8, this)
            return this.__var
        }
    }
}
