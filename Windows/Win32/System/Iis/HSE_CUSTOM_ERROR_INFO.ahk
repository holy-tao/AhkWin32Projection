#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_CUSTOM_ERROR_INFO {
    #StructPack 8

    pszStatus : PSTR

    uHttpSubError : UInt16

    fAsync : BOOL

}
