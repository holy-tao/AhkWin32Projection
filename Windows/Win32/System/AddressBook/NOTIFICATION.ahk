#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ERROR_NOTIFICATION.ahk
#Include .\NEWMAIL_NOTIFICATION.ahk
#Include .\OBJECT_NOTIFICATION.ahk
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
#Include .\SPropValue.ahk
#Include .\SRow.ahk
#Include .\TABLE_NOTIFICATION.ahk
#Include .\EXTENDED_NOTIFICATION.ahk
#Include .\STATUS_OBJECT_NOTIFICATION.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class NOTIFICATION extends Win32Struct
{
    static sizeof => 680

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulEventType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulAlignPad {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {ERROR_NOTIFICATION}
     */
    err{
        get {
            if(!this.HasProp("__err"))
                this.__err := ERROR_NOTIFICATION(this.ptr + 8)
            return this.__err
        }
    }

    /**
     * @type {NEWMAIL_NOTIFICATION}
     */
    newmail{
        get {
            if(!this.HasProp("__newmail"))
                this.__newmail := NEWMAIL_NOTIFICATION(this.ptr + 8)
            return this.__newmail
        }
    }

    /**
     * @type {OBJECT_NOTIFICATION}
     */
    obj{
        get {
            if(!this.HasProp("__obj"))
                this.__obj := OBJECT_NOTIFICATION(this.ptr + 8)
            return this.__obj
        }
    }

    /**
     * @type {TABLE_NOTIFICATION}
     */
    tab{
        get {
            if(!this.HasProp("__tab"))
                this.__tab := TABLE_NOTIFICATION(this.ptr + 8)
            return this.__tab
        }
    }

    /**
     * @type {EXTENDED_NOTIFICATION}
     */
    ext{
        get {
            if(!this.HasProp("__ext"))
                this.__ext := EXTENDED_NOTIFICATION(this.ptr + 8)
            return this.__ext
        }
    }

    /**
     * @type {STATUS_OBJECT_NOTIFICATION}
     */
    statobj{
        get {
            if(!this.HasProp("__statobj"))
                this.__statobj := STATUS_OBJECT_NOTIFICATION(this.ptr + 8)
            return this.__statobj
        }
    }
}
