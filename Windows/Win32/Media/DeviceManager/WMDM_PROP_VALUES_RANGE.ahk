#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\StructuredStorage\CAUL.ahk" { CAUL }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\StructuredStorage\CADATE.ahk" { CADATE }
#Import "..\..\System\Com\StructuredStorage\CAFLT.ahk" { CAFLT }
#Import "..\..\System\Com\StructuredStorage\CABSTR.ahk" { CABSTR }
#Import "..\..\System\Com\StructuredStorage\CAFILETIME.ahk" { CAFILETIME }
#Import "..\..\System\Com\StructuredStorage\BSTRBLOB.ahk" { BSTRBLOB }
#Import "..\..\System\Com\BLOB.ahk" { BLOB }
#Import "..\..\System\Com\StructuredStorage\CALPWSTR.ahk" { CALPWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\System\Com\StructuredStorage\CLIPDATA.ahk" { CLIPDATA }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\System\Com\StructuredStorage\CAL.ahk" { CAL }
#Import "..\..\System\Com\StructuredStorage\CABSTRBLOB.ahk" { CABSTRBLOB }
#Import "..\..\System\Com\StructuredStorage\CAH.ahk" { CAH }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\CAC.ahk" { CAC }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\System\Com\StructuredStorage\CASCODE.ahk" { CASCODE }
#Import "..\..\System\Com\StructuredStorage\CADBL.ahk" { CADBL }
#Import "..\..\System\Com\StructuredStorage\CALPSTR.ahk" { CALPSTR }
#Import "..\..\System\Com\StructuredStorage\CAUH.ahk" { CAUH }
#Import "..\..\System\Com\StructuredStorage\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import "..\..\System\Com\StructuredStorage\CACLIPDATA.ahk" { CACLIPDATA }
#Import "..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\StructuredStorage\CAUB.ahk" { CAUB }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\..\System\Com\StructuredStorage\VERSIONEDSTREAM.ahk" { VERSIONEDSTREAM }
#Import "..\..\System\Com\StructuredStorage\CAI.ahk" { CAI }
#Import "..\..\System\Com\StructuredStorage\CACY.ahk" { CACY }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\StructuredStorage\CAUI.ahk" { CAUI }
#Import "..\..\System\Com\StructuredStorage\CACLSID.ahk" { CACLSID }
#Import "..\..\System\Com\StructuredStorage\CABOOL.ahk" { CABOOL }

/**
 * The WMDM\_PROP\_VALUES\_RANGE structure describes a range of valid values for a particular property in a particular property configuration.
 * @remarks
 * This structure is used in the [**WMDM\_PROP\_DESC**](wmdm-prop-desc.md) structure to describe a range of valid values. A range of valid values is applicable when WMDM\_ENUM\_PROP\_VALID\_VALUES\_ENUM is selected from the [**WMDM\_ENUM\_PROP\_VALID\_VALUES\_FORM**](wmdm-enum-prop-valid-values-form.md) enumeration.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-prop-values-range
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_PROP_VALUES_RANGE {
    #StructPack 8

    /**
     * Minimum value in the range.
     */
    rangeMin : PROPVARIANT

    /**
     * Maximum value in the range.
     */
    rangeMax : PROPVARIANT

    /**
     * The step size in which valid values increment from the minimum value to the maximum value. This permits specifying discrete permissible values in a range.
     */
    rangeStep : PROPVARIANT

}
