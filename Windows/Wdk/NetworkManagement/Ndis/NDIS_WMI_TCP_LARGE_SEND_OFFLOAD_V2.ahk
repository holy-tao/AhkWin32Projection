#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V2 {
    #StructPack 4


    struct _IPv4 {
        Encapsulation : UInt32

        MaxOffLoadSize : UInt32

        MinSegmentCount : UInt32

    }

    struct _IPv6 {
        Encapsulation : UInt32

        MaxOffLoadSize : UInt32

        MinSegmentCount : UInt32

        IpExtensionHeadersSupported : UInt32

        TcpOptionsSupported : UInt32

    }

    IPv4 : NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V2._IPv4

    IPv6 : NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V2._IPv6

}
