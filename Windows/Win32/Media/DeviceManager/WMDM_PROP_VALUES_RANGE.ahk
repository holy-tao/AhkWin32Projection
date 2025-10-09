#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
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
 * The WMDM\_PROP\_VALUES\_RANGE structure describes a range of valid values for a particular property in a particular property configuration.
 * @remarks
 * This structure is used in the [**WMDM\_PROP\_DESC**](wmdm-prop-desc.md) structure to describe a range of valid values. A range of valid values is applicable when WMDM\_ENUM\_PROP\_VALID\_VALUES\_ENUM is selected from the [**WMDM\_ENUM\_PROP\_VALID\_VALUES\_FORM**](wmdm-enum-prop-valid-values-form.md) enumeration.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-prop-values-range
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_PROP_VALUES_RANGE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Minimum value in the range.
     * @type {PROPVARIANT}
     */
    rangeMin{
        get {
            if(!this.HasProp("__rangeMin"))
                this.__rangeMin := PROPVARIANT(this.ptr + 0)
            return this.__rangeMin
        }
    }

    /**
     * Maximum value in the range.
     * @type {PROPVARIANT}
     */
    rangeMax{
        get {
            if(!this.HasProp("__rangeMax"))
                this.__rangeMax := PROPVARIANT(this.ptr + 24)
            return this.__rangeMax
        }
    }

    /**
     * The step size in which valid values increment from the minimum value to the maximum value. This permits specifying discrete permissible values in a range.
     * @type {PROPVARIANT}
     */
    rangeStep{
        get {
            if(!this.HasProp("__rangeStep"))
                this.__rangeStep := PROPVARIANT(this.ptr + 48)
            return this.__rangeStep
        }
    }
}
