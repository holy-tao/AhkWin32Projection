#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Variant\VARIANT.ahk

/**
 * Represents a custom data item.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-custdataitem
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CUSTDATAITEM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The unique identifier of the data item.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The value of the data item.
     * @type {VARIANT}
     */
    varValue{
        get {
            if(!this.HasProp("__varValue"))
                this.__varValue := VARIANT(this.ptr + 8)
            return this.__varValue
        }
    }
}
