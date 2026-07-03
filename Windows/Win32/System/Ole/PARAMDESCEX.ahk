#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\CY.ahk" { CY }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\IRecordInfo.ahk" { IRecordInfo }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains information about the default value of a parameter.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-paramdescex
 * @namespace Windows.Win32.System.Ole
 */
export default struct PARAMDESCEX {
    #StructPack 8

    /**
     * The size of the structure.
     */
    cBytes : UInt32

    /**
     * The default value of the parameter.
     */
    varDefaultValue : VARIANT

}
