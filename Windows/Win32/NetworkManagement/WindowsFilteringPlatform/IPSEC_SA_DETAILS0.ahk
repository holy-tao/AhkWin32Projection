#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_TRAFFIC0.ahk
#Include .\IPSEC_SA_LIFETIME0.ahk
#Include .\IPSEC_SA_BUNDLE0.ahk

/**
 * Is used to store information returned when enumerating IPsec security associations (SAs). (IPSEC_SA_DETAILS0)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_details0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_DETAILS0 extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * Internet Protocol (IP) version as specified by [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version).
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates direction of the IPsec SA as specified by [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction).
     * @type {Integer}
     */
    saDirection {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The traffic being secured by this IPsec SA as specified by [IPSEC_TRAFFIC0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic0).
     * @type {IPSEC_TRAFFIC0}
     */
    traffic{
        get {
            if(!this.HasProp("__traffic"))
                this.__traffic := IPSEC_TRAFFIC0(8, this)
            return this.__traffic
        }
    }

    /**
     * Various parameters of the SA as specified by [IPSEC_SA_BUNDLE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle0).
     * @type {IPSEC_SA_BUNDLE0}
     */
    saBundle{
        get {
            if(!this.HasProp("__saBundle"))
                this.__saBundle := IPSEC_SA_BUNDLE0(72, this)
            return this.__saBundle
        }
    }

    /**
     * @type {Pointer<IPSEC_V4_UDP_ENCAPSULATION0>}
     */
    udpEncapsulation {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * The transport layer filter corresponding to this IPsec SA as specified by [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0).
     * @type {Pointer<FWPM_FILTER0>}
     */
    transportFilter {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }
}
