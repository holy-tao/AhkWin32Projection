#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import "..\Com\CY.ahk" { CY }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBPROP {
    #StructPack 8

    dwPropertyID : UInt32

    dwOptions : UInt32

    dwStatus : UInt32

    colid : DBID

    vValue : VARIANT

}
