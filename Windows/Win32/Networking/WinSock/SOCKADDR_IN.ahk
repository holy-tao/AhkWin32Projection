#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The SOCKADDR_IN (winsock.h) structure varies depending on the protocol selected.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-sockaddr_in
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_IN {
    #StructPack 4

    sin_family : ADDRESS_FAMILY

    sin_port : UInt16

    sin_addr : IN_ADDR

    sin_zero : CHAR[8]

}
