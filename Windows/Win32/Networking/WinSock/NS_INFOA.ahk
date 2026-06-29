#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @charset ANSI
 */
export default struct NS_INFOA {
    #StructPack 8

    dwNameSpace : UInt32

    dwNameSpaceFlags : UInt32

    lpNameSpace : PSTR

}
