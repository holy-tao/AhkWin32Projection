#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes an IPsec DoS Protection drop event.
 * @remarks
 * <b>FWPM_NET_EVENT_IPSEC_DOSP_DROP0</b> is a specific implementation of FWPM_NET_EVENT_IPSEC_DOSP_DROP. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ipsec_dosp_drop0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_IPSEC_DOSP_DROP0 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Internet Protocol (IP) version.
     * 
     * See [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) for more information.
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    publicHostV4Addr {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    publicHostV6Addr{
        get {
            if(!this.HasProp("__publicHostV6AddrProxyArray"))
                this.__publicHostV6AddrProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__publicHostV6AddrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    internalHostV4Addr {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    internalHostV6Addr{
        get {
            if(!this.HasProp("__internalHostV6AddrProxyArray"))
                this.__internalHostV6AddrProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__internalHostV6AddrProxyArray
        }
    }

    /**
     * Contains the  error code for the failure.
     * @type {Integer}
     */
    failureStatus {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * An [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction) value that specifies whether the dropped packet is inbound or outbound.
     * @type {Integer}
     */
    direction {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
