#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
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
class KAGGETDIAG extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VARIANT}
     */
    vDiagInfo{
        get {
            if(!this.HasProp("__vDiagInfo"))
                this.__vDiagInfo := VARIANT(this.ptr + 8)
            return this.__vDiagInfo
        }
    }

    /**
     * @type {Integer}
     */
    sDiagField {
        get => NumGet(this, 32, "short")
        set => NumPut("short", value, this, 32)
    }
}
