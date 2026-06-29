#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_OFFLOAD_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    IPv4Checksum : Int8

    TCPIPv4Checksum : Int8

    UDPIPv4Checksum : Int8

    TCPIPv6Checksum : Int8

    UDPIPv6Checksum : Int8

    LsoV1 : Int8

    IPsecV1 : Int8

    LsoV2IPv4 : Int8

    LsoV2IPv6 : Int8

    TcpConnectionIPv4 : Int8

    TcpConnectionIPv6 : Int8

    Flags : UInt32

}
