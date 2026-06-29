#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_IPSEC_OFFLOAD_V1 {
    #StructPack 4


    struct _Supported {
        Encapsulation : UInt32

        AhEspCombined : UInt32

        TransportTunnelCombined : UInt32

        IPv4Options : UInt32

        Flags : UInt32

    }

    struct _IPv4AH {
        Md5 : UInt32

        Sha_1 : UInt32

        Transport : UInt32

        Tunnel : UInt32

        Send : UInt32

        Receive : UInt32

    }

    struct _IPv4ESP {
        Des : UInt32

        Reserved : UInt32

        TripleDes : UInt32

        NullEsp : UInt32

        Transport : UInt32

        Tunnel : UInt32

        Send : UInt32

        Receive : UInt32

    }

    Supported : NDIS_WMI_IPSEC_OFFLOAD_V1._Supported

    IPv4AH : NDIS_WMI_IPSEC_OFFLOAD_V1._IPv4AH

    IPv4ESP : NDIS_WMI_IPSEC_OFFLOAD_V1._IPv4ESP

}
