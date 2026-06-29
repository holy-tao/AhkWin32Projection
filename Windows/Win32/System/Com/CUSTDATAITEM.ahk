#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDispatch.ahk" { IDispatch }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CY.ahk" { CY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Represents a custom data item.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-custdataitem
 * @namespace Windows.Win32.System.Com
 */
export default struct CUSTDATAITEM {
    #StructPack 8

    /**
     * The unique identifier of the data item.
     */
    guid : Guid

    /**
     * The value of the data item.
     */
    varValue : VARIANT

}
