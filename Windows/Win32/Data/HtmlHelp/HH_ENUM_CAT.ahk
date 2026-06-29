#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct HH_ENUM_CAT {
    #StructPack 8

    cbStruct : Int32

    pszCatName : PSTR

    pszCatDescription : PSTR

}
