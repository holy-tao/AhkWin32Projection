#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include .\IRecordInfo.ahk
#Include ..\Variant\VARENUM.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Com\CY.ahk
#Include ..\Com\SAFEARRAY.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * Contains information about the default value of a parameter.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-paramdescex
 * @namespace Windows.Win32.System.Ole
 */
class PARAMDESCEX extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of the structure.
     * @type {Integer}
     */
    cBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The default value of the parameter.
     * @type {VARIANT}
     */
    varDefaultValue {
        get {
            if(!this.HasProp("__varDefaultValue"))
                this.__varDefaultValue := VARIANT(8, this)
            return this.__varDefaultValue
        }
    }
}
