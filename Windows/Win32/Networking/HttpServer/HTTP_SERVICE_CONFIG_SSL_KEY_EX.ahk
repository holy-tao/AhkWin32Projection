#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_KEY_EX {
    #StructPack 8

    IpPort : SOCKADDR_STORAGE

}
