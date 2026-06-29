#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_DIRECTION.ahk" { FWP_DIRECTION }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * Contains information that describes an IPsec DoS Protection drop event.
 * @remarks
 * <b>FWPM_NET_EVENT_IPSEC_DOSP_DROP0</b> is a specific implementation of FWPM_NET_EVENT_IPSEC_DOSP_DROP. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ipsec_dosp_drop0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_IPSEC_DOSP_DROP0 {
    #StructPack 4

    /**
     * Internet Protocol (IP) version.
     * 
     * See [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) for more information.
     */
    ipVersion : FWP_IP_VERSION

    publicHostV4Addr : UInt32

    internalHostV4Addr : UInt32

    /**
     * Contains the  error code for the failure.
     */
    failureStatus : Int32

    /**
     * An [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction) value that specifies whether the dropped packet is inbound or outbound.
     */
    direction : FWP_DIRECTION

    static __New() {
        DefineProp(this.Prototype, 'publicHostV6Addr', { type: Int8[16], offset: 4 })
        DefineProp(this.Prototype, 'internalHostV6Addr', { type: Int8[16], offset: 20 })
        this.DeleteProp("__New")
    }
}
