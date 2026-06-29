#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Win32\Networking\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct NFS_OPEN_ECP_CONTEXT {
    #StructPack 8

    ExportAlias : UNICODE_STRING.Ptr

    ClientSocketAddress : SOCKADDR_STORAGE.Ptr

}
