#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the User Datagram Protocol (UDP) encapsulation ports for Encapsulating Security Payload (ESP) encapsulation.
 * @remarks
 * This is used only when a NAT was detected as part of the IPsec NAT traversal specification.
 * 
 * <b>IPSEC_V4_UDP_ENCAPSULATION0</b> is a specific implementation of IPSEC_V4_UDP_ENCAPSULATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_v4_udp_encapsulation0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_V4_UDP_ENCAPSULATION0 {
    #StructPack 2

    /**
     * Source UDP encapsulation port.
     */
    localUdpEncapPort : UInt16

    /**
     * Destination UDP encapsulation port.
     */
    remoteUdpEncapPort : UInt16

}
