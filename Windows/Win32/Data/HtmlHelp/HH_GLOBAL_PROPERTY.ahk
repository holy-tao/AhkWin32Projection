#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import ".\HH_GPROPID.ahk" { HH_GPROPID }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct HH_GLOBAL_PROPERTY {
    #StructPack 8

    id : HH_GPROPID

    var : VARIANT

}
