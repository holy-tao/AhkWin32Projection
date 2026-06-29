#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Win32\Networking\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SRV_INSTANCE_TYPE.ahk" { SRV_INSTANCE_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SRV_OPEN_ECP_CONTEXT {
    #StructPack 8

    ShareName : UNICODE_STRING.Ptr

    SocketAddress : SOCKADDR_STORAGE.Ptr

    OplockBlockState : BOOLEAN

    OplockAppState : BOOLEAN

    OplockFinalState : BOOLEAN

    Version : UInt16

    InstanceType : SRV_INSTANCE_TYPE

}
