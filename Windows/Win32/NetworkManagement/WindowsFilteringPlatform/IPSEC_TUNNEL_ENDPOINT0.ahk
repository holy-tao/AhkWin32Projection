#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * Used to store address information for an end point of a tunnel mode SA.
 * @remarks
 * For the unnamed union containing the tunnel end point address, switch_type(FWP_IP_VERSION), switch_is(ipVersion).
 * 
 * <b>IPSEC_TUNNEL_ENDPOINT0</b> is a specific implementation of IPSEC_TUNNEL_ENDPOINT. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoint0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TUNNEL_ENDPOINT0 {
    #StructPack 4

    /**
     * Type: [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version)</b>
     * 
     * Specifies the IP version. In tunnel mode, this is the version of the outer header.
     */
    ipVersion : FWP_IP_VERSION

    v4Address : UInt32

    static __New() {
        DefineProp(this.Prototype, 'v6Address', { type: Int8[16], offset: 4 })
        this.DeleteProp("__New")
    }
}
