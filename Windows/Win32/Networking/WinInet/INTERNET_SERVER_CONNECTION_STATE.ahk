#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_SERVER_CONNECTION_STATE {
    #StructPack 8

    lpcwszHostName : PWSTR

    fProxy : BOOL

    dwCounter : UInt32

    dwConnectionLimit : UInt32

    dwAvailableCreates : UInt32

    dwAvailableKeepAlives : UInt32

    dwActiveConnections : UInt32

    dwWaiters : UInt32

}
