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
 * The TS_ATTRVAL structure contains document attribute values.
 * @remarks
 * An application uses attributes to expose its data to TSF, whereas text services use properties to expose their data to TSF. <b>TS_ATTRVAL</b> is used in <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreacp">ITextStoreACP</a> and <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreanchor">ITextStoreAnchor</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ns-textstor-ts_attrval
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TS_ATTRVAL {
    #StructPack 8

    /**
     * GUID for the attribute type.
     */
    idAttr : Guid

    /**
     * A unique identifier of this attribute when overlapped with other attributes. This is a feature in <a href="https://docs.microsoft.com/previous-versions/ms971350(v=msdn.10)">Microsoft Active Accessibility</a>. In TSF, this parameter value is zero (0). Any nonzero value is ignored.
     */
    dwOverlapId : UInt32

    /**
     * Value of the attribute.
     */
    varValue : VARIANT

}
