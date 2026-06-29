#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import ".\SOCKET_SECURITY_PROTOCOL.ahk" { SOCKET_SECURITY_PROTOCOL }
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET_SECURITY_QUERY_TEMPLATE_IPSEC2 {
    #StructPack 8

    SecurityProtocol : SOCKET_SECURITY_PROTOCOL

    PeerAddress : SOCKADDR_STORAGE

    PeerTokenAccessMask : UInt32

    Flags : UInt32

    FieldMask : UInt32

}
