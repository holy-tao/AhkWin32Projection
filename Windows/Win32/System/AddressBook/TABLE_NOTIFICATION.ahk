#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SBinary.ahk
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
#Include .\SPropValue.ahk
#Include .\SRow.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/table_notification
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class TABLE_NOTIFICATION extends Win32Struct
{
    static sizeof => 672

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulTableEvent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HRESULT}
     */
    hResult {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {SPropValue}
     */
    propIndex{
        get {
            if(!this.HasProp("__propIndex"))
                this.__propIndex := SPropValue(8, this)
            return this.__propIndex
        }
    }

    /**
     * @type {SPropValue}
     */
    propPrior{
        get {
            if(!this.HasProp("__propPrior"))
                this.__propPrior := SPropValue(328, this)
            return this.__propPrior
        }
    }

    /**
     * @type {SRow}
     */
    row{
        get {
            if(!this.HasProp("__row"))
                this.__row := SRow(648, this)
            return this.__row
        }
    }

    /**
     * @type {Integer}
     */
    ulPad {
        get => NumGet(this, 664, "uint")
        set => NumPut("uint", value, this, 664)
    }
}
