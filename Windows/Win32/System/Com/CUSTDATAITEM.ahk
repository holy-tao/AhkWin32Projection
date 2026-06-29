#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Ole\IRecordInfo.ahk
#Include ..\Variant\VARENUM.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDispatch.ahk
#Include .\CY.ahk
#Include .\SAFEARRAY.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\IUnknown.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * Represents a custom data item.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-custdataitem
 * @namespace Windows.Win32.System.Com
 */
class CUSTDATAITEM extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * The unique identifier of the data item.
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(0, this)
            return this.__guid
        }
    }

    /**
     * The value of the data item.
     * @type {VARIANT}
     */
    varValue {
        get {
            if(!this.HasProp("__varValue"))
                this.__varValue := VARIANT(16, this)
            return this.__varValue
        }
    }
}
