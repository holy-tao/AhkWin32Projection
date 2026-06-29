#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

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
