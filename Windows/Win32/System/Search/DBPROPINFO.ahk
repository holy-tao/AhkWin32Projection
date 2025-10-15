#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\CHAR.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPROPINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszDescription{
        get {
            if(!this.HasProp("__pwszDescription"))
                this.__pwszDescription := PWSTR(this.ptr + 0)
            return this.__pwszDescription
        }
    }

    /**
     * @type {Integer}
     */
    dwPropertyID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    vtType {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {VARIANT}
     */
    vValues{
        get {
            if(!this.HasProp("__vValues"))
                this.__vValues := VARIANT(this.ptr + 24)
            return this.__vValues
        }
    }
}
