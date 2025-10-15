#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\CHAR.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\StructuredStorage\BSTRBLOB.ahk
#Include ..\..\System\Com\BLOB.ahk
#Include ..\..\Foundation\PSTR.ahk
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
#Include .\WMDM_PROP_VALUES_RANGE.ahk
#Include .\WMDM_PROP_VALUES_ENUM.ahk

/**
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_PROP_DESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszPropName{
        get {
            if(!this.HasProp("__pwszPropName"))
                this.__pwszPropName := PWSTR(this.ptr + 0)
            return this.__pwszPropName
        }
    }

    /**
     * @type {Integer}
     */
    ValidValuesForm {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {WMDM_PROP_VALUES_RANGE}
     */
    ValidValuesRange{
        get {
            if(!this.HasProp("__ValidValuesRange"))
                this.__ValidValuesRange := WMDM_PROP_VALUES_RANGE(this.ptr + 16)
            return this.__ValidValuesRange
        }
    }

    /**
     * @type {WMDM_PROP_VALUES_ENUM}
     */
    EnumeratedValidValues{
        get {
            if(!this.HasProp("__EnumeratedValidValues"))
                this.__EnumeratedValidValues := WMDM_PROP_VALUES_ENUM(this.ptr + 16)
            return this.__EnumeratedValidValues
        }
    }
}
