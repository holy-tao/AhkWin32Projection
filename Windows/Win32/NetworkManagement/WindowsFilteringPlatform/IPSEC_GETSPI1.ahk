#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_TRAFFIC1.ahk" { IPSEC_TRAFFIC1 }
#Import ".\IPSEC_V4_UDP_ENCAPSULATION0.ahk" { IPSEC_V4_UDP_ENCAPSULATION0 }
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * The IPSEC_GETSPI1 structure contains information that must be supplied when requesting a security parameter index (SPI) from the IPsec driver.Note  IPSEC_GETSPI1 is the specific implementation of IPSEC_GETSPI used in Windows 7 and later.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_getspi1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_GETSPI1 {
    #StructPack 8

    /**
     * An [IPSEC_TRAFFIC1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic1) structure that describes traffic characteristics of the inbound IPsec SA.
     */
    inboundIpsecTraffic : IPSEC_TRAFFIC1

    /**
     * An [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) value that indicates the IP version of the inbound IPsec traffic.
     */
    ipVersion : FWP_IP_VERSION

    inboundUdpEncapsulation : IPSEC_V4_UDP_ENCAPSULATION0.Ptr

    /**
     * Not used. An <b>IPSEC_CRYPTO_MODULE_ID</b> is a <b>GUID</b> value.
     */
    rngCryptoModuleID : Guid.Ptr

}
