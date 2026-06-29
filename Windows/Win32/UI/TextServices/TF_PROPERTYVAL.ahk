#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * The TF_PROPERTYVAL structure contains property value data. This structure is used with the IEnumTfPropertyValue::Next method.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_propertyval
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_PROPERTYVAL {
    #StructPack 8

    /**
     * A <b>GUID</b> that identifies the property type. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property identifiers</a>.
     */
    guidId : Guid

    /**
     * A <b>VARIANT</b> that contains the value of the property specified by <b>guidId</b>. The user must know the type and format of this data.
     */
    varValue : VARIANT

}
