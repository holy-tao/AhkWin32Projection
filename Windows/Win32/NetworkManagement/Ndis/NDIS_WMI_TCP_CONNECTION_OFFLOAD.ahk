#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_TCP_CONNECTION_OFFLOAD {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    Encapsulation : UInt32

    SupportIPv4 : UInt32

    SupportIPv6 : UInt32

    SupportIPv6ExtensionHeaders : UInt32

    SupportSack : UInt32

    TcpConnectionOffloadCapacity : UInt32

    Flags : UInt32

}
