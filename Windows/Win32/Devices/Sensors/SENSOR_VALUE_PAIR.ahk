#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\System\Com\StructuredStorage\BSTRBLOB.ahk
#Include ..\..\System\Com\BLOB.ahk
#Include ..\..\System\Com\StructuredStorage\CAC.ahk
#Include ..\..\System\Com\StructuredStorage\CAUB.ahk
#Include ..\..\System\Com\StructuredStorage\CAI.ahk
#Include ..\..\System\Com\StructuredStorage\CAUI.ahk
#Include ..\..\System\Com\StructuredStorage\CAL.ahk
#Include ..\..\System\Com\StructuredStorage\CAUL.ahk
#Include ..\..\System\Com\StructuredStorage\CAH.ahk
#Include ..\..\System\Com\StructuredStorage\CAUH.ahk
#Include ..\..\System\Com\StructuredStorage\CAFLT.ahk
#Include ..\..\System\Com\StructuredStorage\CADBL.ahk
#Include ..\..\System\Com\StructuredStorage\CABOOL.ahk
#Include ..\..\System\Com\StructuredStorage\CASCODE.ahk
#Include ..\..\System\Com\StructuredStorage\CACY.ahk
#Include ..\..\System\Com\StructuredStorage\CADATE.ahk
#Include ..\..\System\Com\StructuredStorage\CAFILETIME.ahk
#Include ..\..\System\Com\StructuredStorage\CACLSID.ahk
#Include ..\..\System\Com\StructuredStorage\CACLIPDATA.ahk
#Include ..\..\System\Com\StructuredStorage\CABSTR.ahk
#Include ..\..\System\Com\StructuredStorage\CABSTRBLOB.ahk
#Include ..\..\System\Com\StructuredStorage\CALPSTR.ahk
#Include ..\..\System\Com\StructuredStorage\CALPWSTR.ahk
#Include ..\..\System\Com\StructuredStorage\CAPROPVARIANT.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class SENSOR_VALUE_PAIR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PROPERTYKEY}
     */
    Key{
        get {
            if(!this.HasProp("__Key"))
                this.__Key := PROPERTYKEY(this.ptr + 0)
            return this.__Key
        }
    }

    /**
     * @type {PROPVARIANT}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := PROPVARIANT(this.ptr + 16)
            return this.__Value
        }
    }
}
