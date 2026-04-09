#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Variant\VARENUM.ahk
#Include .\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUnknown.ahk
#Include .\IDispatch.ahk
#Include .\SAFEARRAY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Ole\IRecordInfo.ahk

/**
 * Represents a custom data item.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-custdataitem
 * @namespace Windows.Win32.System.Com
 */
class CUSTDATAITEM extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The unique identifier of the data item.
     * @type {Pointer}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The value of the data item.
     * @type {VARIANT}
     */
    varValue {
        get {
            if(!this.HasProp("__varValue"))
                this.__varValue := VARIANT(8, this)
            return this.__varValue
        }
    }
}
