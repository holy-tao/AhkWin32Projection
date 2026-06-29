#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_FILTER_ACCESS_DENIED {
    #StructPack 8

    pszURL : PSTR

    pszPhysicalPath : PSTR

    dwReason : UInt32

}
