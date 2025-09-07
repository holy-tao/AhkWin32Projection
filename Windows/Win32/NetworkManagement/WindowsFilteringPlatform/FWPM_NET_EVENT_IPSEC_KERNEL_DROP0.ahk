#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes an IPsec kernel drop event.
 * @remarks
 * <b>FWPM_NET_EVENT_IPSEC_KERNEL_DROP0</b> is a specific implementation of FWPM_NET_EVENT_IPSEC_KERNEL_DROP. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ipsec_kernel_drop0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_IPSEC_KERNEL_DROP0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains the  error code for the failure.
     * @type {Integer}
     */
    failureStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction) value that specifies whether the dropped packet is inbound or outbound.
     * @type {Integer}
     */
    direction {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Contains the security parameters index (SPI) on the IPsec header of the packet.  This will be 0 for clear text packets.  The <b>IPSEC_SA_SPI</b> is identical to a <b>UINT32</b>.
     * @type {Integer}
     */
    spi {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Filter ID that corresponds to the IPsec callout filter.  This will be available only if the packet was dropped by the IPsec callout.
     * @type {Integer}
     */
    filterId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Layer ID that corresponds to the IPsec callout filter.  This will be available only if the packet was dropped by the IPsec callout.
     * @type {Integer}
     */
    layerId {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
