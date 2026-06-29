#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_DIRECTION.ahk" { FWP_DIRECTION }

/**
 * Contains information that describes an IPsec kernel drop event.
 * @remarks
 * <b>FWPM_NET_EVENT_IPSEC_KERNEL_DROP0</b> is a specific implementation of FWPM_NET_EVENT_IPSEC_KERNEL_DROP. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ipsec_kernel_drop0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_IPSEC_KERNEL_DROP0 {
    #StructPack 8

    /**
     * Contains the  error code for the failure.
     */
    failureStatus : Int32

    /**
     * An [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction) value that specifies whether the dropped packet is inbound or outbound.
     */
    direction : FWP_DIRECTION

    /**
     * Contains the security parameters index (SPI) on the IPsec header of the packet.  This will be 0 for clear text packets.  The <b>IPSEC_SA_SPI</b> is identical to a <b>UINT32</b>.
     */
    spi : UInt32

    /**
     * Filter ID that corresponds to the IPsec callout filter.  This will be available only if the packet was dropped by the IPsec callout.
     */
    filterId : Int64

    /**
     * Layer ID that corresponds to the IPsec callout filter.  This will be available only if the packet was dropped by the IPsec callout.
     */
    layerId : UInt16

}
