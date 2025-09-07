#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DCINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    eInfoType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VARIANT}
     */
    vData{
        get {
            if(!this.HasProp("__vData"))
                this.__vData := VARIANT(this.ptr + 8)
            return this.__vData
        }
    }
}
