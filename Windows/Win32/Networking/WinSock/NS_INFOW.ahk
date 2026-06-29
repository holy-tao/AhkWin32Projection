#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @charset Unicode
 */
export default struct NS_INFOW {
    #StructPack 8

    dwNameSpace : UInt32

    dwNameSpaceFlags : UInt32

    lpNameSpace : PWSTR

}
