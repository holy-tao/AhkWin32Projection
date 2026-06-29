#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used to store information specific to virtual interface tunneling.
 * @remarks
 * The <b>IPSEC_VIRTUAL_IF_TUNNEL_INFO0</b> structure is applicable only to Internet Key Exchange version 2 (IKEv2).
 * 
 * <b>IPSEC_VIRTUAL_IF_TUNNEL_INFO0</b> is a specific implementation of IPSEC_VIRTUAL_IF_TUNNEL_INFO. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-ipsec_virtual_if_tunnel_info0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_VIRTUAL_IF_TUNNEL_INFO0 {
    #StructPack 8

    /**
     * ID of the  virtual interface tunnel state.
     */
    virtualIfTunnelId : Int64

    /**
     * ID of the virtual interface tunneling traffic selector(s).
     */
    trafficSelectorId : Int64

}
