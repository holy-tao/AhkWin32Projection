#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\CY.ahk" { CY }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct KAGGETDIAG {
    #StructPack 8

    ulSize : UInt32

    vDiagInfo : VARIANT

    sDiagField : Int16

}
