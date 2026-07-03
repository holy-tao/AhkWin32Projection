#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\CY.ahk" { CY }
#Import ".\IDispatch.ahk" { IDispatch }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

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
