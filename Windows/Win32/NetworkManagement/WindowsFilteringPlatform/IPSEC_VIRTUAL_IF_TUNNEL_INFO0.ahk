#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store information specific to virtual interface tunneling.
 * @remarks
 * The <b>IPSEC_VIRTUAL_IF_TUNNEL_INFO0</b> structure is applicable only to Internet Key Exchange version 2 (IKEv2).
  * 
  * <b>IPSEC_VIRTUAL_IF_TUNNEL_INFO0</b> is a specific implementation of IPSEC_VIRTUAL_IF_TUNNEL_INFO. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-ipsec_virtual_if_tunnel_info0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_VIRTUAL_IF_TUNNEL_INFO0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * ID of the  virtual interface tunnel state.
     * @type {Integer}
     */
    virtualIfTunnelId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * ID of the virtual interface tunneling traffic selector(s).
     * @type {Integer}
     */
    trafficSelectorId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
