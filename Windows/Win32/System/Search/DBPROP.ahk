#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

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
