#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Ole\IRecordInfo.ahk
#Include ..\Variant\VARENUM.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Com\CY.ahk
#Include ..\Com\SAFEARRAY.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
class DBPROPINFO extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszDescription {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
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
     * @type {VARENUM}
     */
    vtType {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {VARIANT}
     */
    vValues {
        get {
            if(!this.HasProp("__vValues"))
                this.__vValues := VARIANT(24, this)
            return this.__vValues
        }
    }
}
