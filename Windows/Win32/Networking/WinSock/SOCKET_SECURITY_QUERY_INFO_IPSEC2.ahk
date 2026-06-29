#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SOCKET_SECURITY_PROTOCOL.ahk" { SOCKET_SECURITY_PROTOCOL }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET_SECURITY_QUERY_INFO_IPSEC2 {
    #StructPack 8

    SecurityProtocol : SOCKET_SECURITY_PROTOCOL

    Flags : UInt32

    PeerApplicationAccessTokenHandle : Int64

    PeerMachineAccessTokenHandle : Int64

    MmSaId : Int64

    QmSaId : Int64

    NegotiationWinerr : UInt32

    SaLookupContext : Guid

}
