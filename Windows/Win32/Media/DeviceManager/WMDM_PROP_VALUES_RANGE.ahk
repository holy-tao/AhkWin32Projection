#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\BSTR.ahk
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
 * 
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-prop-values-range
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_PROP_VALUES_RANGE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {PROPVARIANT}
     */
    rangeMin{
        get {
            if(!this.HasProp("__rangeMin"))
                this.__rangeMin := PROPVARIANT(0, this)
            return this.__rangeMin
        }
    }

    /**
     * @type {PROPVARIANT}
     */
    rangeMax{
        get {
            if(!this.HasProp("__rangeMax"))
                this.__rangeMax := PROPVARIANT(24, this)
            return this.__rangeMax
        }
    }

    /**
     * @type {PROPVARIANT}
     */
    rangeStep{
        get {
            if(!this.HasProp("__rangeStep"))
                this.__rangeStep := PROPVARIANT(48, this)
            return this.__rangeStep
        }
    }
}
