#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_SEND_HEADER_EX_INFO {
    #StructPack 8

    pszStatus : PSTR

    pszHeader : PSTR

    cchStatus : UInt32

    cchHeader : UInt32

    fKeepConn : BOOL

}
