#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINT_FEATURE_OPTION {
    #StructPack 8

    pszFeature : PSTR

    pszOption : PSTR

}
