#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }
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
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBPROPINFO {
    #StructPack 8

    pwszDescription : PWSTR

    dwPropertyID : UInt32

    dwFlags : UInt32

    vtType : VARENUM

    vValues : VARIANT

}
