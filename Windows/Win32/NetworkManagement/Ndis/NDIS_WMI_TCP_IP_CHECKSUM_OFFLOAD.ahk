#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD {
    #StructPack 4


    struct _IPv4Transmit {
        Encapsulation : UInt32

        IpOptionsSupported : UInt32

        TcpOptionsSupported : UInt32

        TcpChecksum : UInt32

        UdpChecksum : UInt32

        IpChecksum : UInt32

    }

    struct _IPv4Receive {
        Encapsulation : UInt32

        IpOptionsSupported : UInt32

        TcpOptionsSupported : UInt32

        TcpChecksum : UInt32

        UdpChecksum : UInt32

        IpChecksum : UInt32

    }

    struct _IPv6Transmit {
        Encapsulation : UInt32

        IpExtensionHeadersSupported : UInt32

        TcpOptionsSupported : UInt32

        TcpChecksum : UInt32

        UdpChecksum : UInt32

    }

    struct _IPv6Receive {
        Encapsulation : UInt32

        IpExtensionHeadersSupported : UInt32

        TcpOptionsSupported : UInt32

        TcpChecksum : UInt32

        UdpChecksum : UInt32

    }

    IPv4Transmit : NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD._IPv4Transmit

    IPv4Receive : NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD._IPv4Receive

    IPv6Transmit : NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD._IPv6Transmit

    IPv6Receive : NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD._IPv6Receive

}
