#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_FILTER_AUTHENT {
    #StructPack 8

    pszUser : PSTR

    cbUserBuff : UInt32

    pszPassword : PSTR

    cbPasswordBuff : UInt32

}
