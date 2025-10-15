#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\SBinary.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SShortArray.ahk
#Include .\SLongArray.ahk
#Include .\SRealArray.ahk
#Include .\SDoubleArray.ahk
#Include .\SCurrencyArray.ahk
#Include .\SAppTimeArray.ahk
#Include .\SDateTimeArray.ahk
#Include .\SBinaryArray.ahk
#Include .\SLPSTRArray.ahk
#Include .\SWStringArray.ahk
#Include .\SGuidArray.ahk
#Include .\SLargeIntegerArray.ahk
#Include .\__UPV.ahk

/**
 * Do not use. Contains the property tag values.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-spropvalue
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SPropValue extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the property tag for the property. Property tags are 32-bit unsigned integers consisting of the property's unique identifier in the high-order 16 bits and the property's type in the low-order 16 bits.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * @type {Integer}
     */
    dwAlignPad {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Union of data values, with the specific value dictated by the property type. The following text provides a list for each property type of the member of the union to be used and its associated data type.
     * @type {__UPV}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := __UPV(this.ptr + 8)
            return this.__Value
        }
    }
}
