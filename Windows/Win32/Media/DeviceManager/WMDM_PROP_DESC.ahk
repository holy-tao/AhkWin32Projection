#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\StructuredStorage\CAUL.ahk" { CAUL }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\StructuredStorage\CADATE.ahk" { CADATE }
#Import ".\WMDM_PROP_VALUES_RANGE.ahk" { WMDM_PROP_VALUES_RANGE }
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
#Import ".\WMDM_ENUM_PROP_VALID_VALUES_FORM.ahk" { WMDM_ENUM_PROP_VALID_VALUES_FORM }
#Import "..\..\System\Com\StructuredStorage\CAUH.ahk" { CAUH }
#Import "..\..\System\Com\StructuredStorage\CAPROPVARIANT.ahk" { CAPROPVARIANT }
#Import ".\WMDM_PROP_VALUES_ENUM.ahk" { WMDM_PROP_VALUES_ENUM }
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
 * The WMDM\_PROP\_DESC structure describes valid values of a property in a particular property configuration.
 * @remarks
 * The **WMDM\_PROP\_DESC** structure contains a property description that consists of a property name and its valid values in a particular configuration.
 * 
 * The caller is required to free the memory used by **ValidValuesRange** or **EnumeratedValues**. For an example of how to do this, see [**WMDM\_FORMAT\_CAPABILITY**](wmdm-format-capability.md).
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-prop-desc
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_PROP_DESC {
    #StructPack 8


    struct _ValidValues {
        ValidValuesRange : WMDM_PROP_VALUES_RANGE

        static __New() {
            DefineProp(this.Prototype, 'EnumeratedValidValues', { type: WMDM_PROP_VALUES_ENUM, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Name of the property. The application must free this memory when it is done using it.
     */
    pwszPropName : PWSTR

    /**
     * An [**WMDM\_ENUM\_PROP\_VALID\_VALUES\_FORM**](wmdm-enum-prop-valid-values-form.md) enumeration value describing the type of values, such as a range or list. The value of this enumeration determines which member variable is used.
     */
    ValidValuesForm : WMDM_ENUM_PROP_VALID_VALUES_FORM

    /**
     * Holds the valid values of the property in a particular property configuration. This member holds one of three items: the enumeration value WMDM\_ENUM\_PROP\_VALID\_VALUES\_ANY; the member **ValidValuesRange**; or the member **EnumeratedValidValues**. The value or member is indicated by **ValidValuesForm**.
     */
    ValidValues : WMDM_PROP_DESC._ValidValues

}
