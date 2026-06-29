#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_V4_UDP_ENCAPSULATION0.ahk" { IPSEC_V4_UDP_ENCAPSULATION0 }
#Import ".\IPSEC_TRAFFIC0.ahk" { IPSEC_TRAFFIC0 }
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * The IPSEC_GETSPI0 structure contains information that must be supplied when requesting a security parameter index (SPI) from the IPsec driver.Note  IPSEC_GETSPI0 is the specific implementation of IPSEC_GETSPI used in Windows Vista.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_getspi0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_GETSPI0 {
    #StructPack 8

    /**
     * An [IPSEC_TRAFFIC0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic0) structure that describes traffic characteristics of the inbound IPsec SA.
     */
    inboundIpsecTraffic : IPSEC_TRAFFIC0

    /**
     * A [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) value that indicates the IP version of the inbound IPsec traffic.
     */
    ipVersion : FWP_IP_VERSION

    inboundUdpEncapsulation : IPSEC_V4_UDP_ENCAPSULATION0.Ptr

    /**
     * Not used. A <b>IPSEC_CRYPTO_MODULE_ID</b> is a <b>GUID</b> value.
     */
    rngCryptoModuleID : Guid.Ptr

}
