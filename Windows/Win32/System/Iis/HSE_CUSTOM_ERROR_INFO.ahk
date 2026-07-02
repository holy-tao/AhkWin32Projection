#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_CUSTOM_ERROR_INFO {
    #StructPack 8

    pszStatus : PSTR

    uHttpSubError : UInt16

    fAsync : BOOL

}
