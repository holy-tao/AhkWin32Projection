#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\System\Com\BLOB.ahk
#Include .\SENSOR_VALUE_PAIR.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\System\Com\StructuredStorage\CADATE.ahk
#Include ..\..\System\Com\StructuredStorage\CAH.ahk
#Include ..\..\System\Com\StructuredStorage\BSTRBLOB.ahk
#Include ..\..\System\Variant\VARENUM.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\CHAR.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\System\Com\StructuredStorage\CLIPDATA.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\StructuredStorage\CABSTRBLOB.ahk
#Include ..\..\System\Com\SAFEARRAY.ahk
#Include ..\..\System\Com\StructuredStorage\CAPROPVARIANT.ahk
#Include ..\..\System\Com\StructuredStorage\CACLIPDATA.ahk
#Include ..\..\System\Com\StructuredStorage\CAUB.ahk
#Include ..\..\System\Com\StructuredStorage\CACLSID.ahk
#Include ..\..\System\Com\StructuredStorage\CADBL.ahk
#Include ..\..\System\Com\StructuredStorage\CAFLT.ahk
#Include ..\..\System\Com\StructuredStorage\CAC.ahk
#Include ..\..\System\Com\StructuredStorage\CASCODE.ahk
#Include ..\..\System\Com\StructuredStorage\IStorage.ahk
#Include ..\..\System\Com\StructuredStorage\CALPSTR.ahk
#Include ..\..\System\Com\StructuredStorage\CABOOL.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\StructuredStorage\VERSIONEDSTREAM.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\StructuredStorage\CAI.ahk
#Include ..\..\System\Com\StructuredStorage\CAUL.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Com\StructuredStorage\CAUH.ahk
#Include ..\..\System\Com\StructuredStorage\CABSTR.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\StructuredStorage\CAL.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\StructuredStorage\CAFILETIME.ahk
#Include ..\..\System\Com\StructuredStorage\CAUI.ahk
#Include ..\..\System\Com\StructuredStorage\CALPWSTR.ahk
#Include ..\..\System\Com\StructuredStorage\CACY.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class SENSOR_COLLECTION_LIST extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AllocatedSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {SENSOR_VALUE_PAIR}
     */
    List {
        get {
            if(!this.HasProp("__ListProxyArray"))
                this.__ListProxyArray := Win32FixedArray(this.ptr + 8, 1, SENSOR_VALUE_PAIR, "")
            return this.__ListProxyArray
        }
    }
}
