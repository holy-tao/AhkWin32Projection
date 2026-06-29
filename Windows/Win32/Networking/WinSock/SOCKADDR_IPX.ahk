#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_IPX {
    #StructPack 2

    sa_family : Int16

    sa_netnum : CHAR[4]

    sa_nodenum : CHAR[6]

    sa_socket : UInt16

}
