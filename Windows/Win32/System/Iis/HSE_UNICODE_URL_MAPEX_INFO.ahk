#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_UNICODE_URL_MAPEX_INFO {
    #StructPack 4

    lpszPath : WCHAR[260]

    dwFlags : UInt32

    cchMatchingPath : UInt32

    cchMatchingURL : UInt32

}
