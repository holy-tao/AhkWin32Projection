#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPTRANSITIONPROPERTY {
    #StructPack 8

    pszName : PWSTR

    ulId : UInt32

    pszValue : PWSTR

    vValue : VARIANT

}
