#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_URL_MAPEX_INFO {
    #StructPack 4

    lpszPath : CHAR[260]

    dwFlags : UInt32

    cchMatchingPath : UInt32

    cchMatchingURL : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}
