#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The sockaddr structure varies depending on the protocol selected. (sockaddr)
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-sockaddr
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR {
    #StructPack 2

    sa_family : ADDRESS_FAMILY

    sa_data : CHAR[14]

}
