#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_TRAFFIC1.ahk
#Include .\IPSEC_SA_LIFETIME0.ahk
#Include .\IPSEC_SA_BUNDLE1.ahk
#Include .\IPSEC_VIRTUAL_IF_TUNNEL_INFO0.ahk

/**
 * Is used to store information returned when enumerating IPsec security associations (SAs). (IPSEC_SA_DETAILS1)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_DETAILS1 extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * An [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) value that specifies the IP version. In tunnel mode, this is the version of the outer header.
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction) value that indicates the direction of the IPsec SA.
     * @type {Integer}
     */
    saDirection {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An [IPSEC_TRAFFIC1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic1) structure that specifies the traffic being secured by this IPsec SA. In tunnel mode, this contains both the tunnel endpoints and Quick Mode (QM)  traffic selectors.
     * @type {IPSEC_TRAFFIC1}
     */
    traffic{
        get {
            if(!this.HasProp("__traffic"))
                this.__traffic := IPSEC_TRAFFIC1(this.ptr + 8)
            return this.__traffic
        }
    }

    /**
     * An [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure that specifies various parameters of the SA .
     * @type {IPSEC_SA_BUNDLE1}
     */
    saBundle{
        get {
            if(!this.HasProp("__saBundle"))
                this.__saBundle := IPSEC_SA_BUNDLE1(this.ptr + 56)
            return this.__saBundle
        }
    }

    /**
     * @type {Pointer<TypeHandle>}
     */
    Anonymous {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * An [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0) structure that specifies the transport layer filter that corresponds to this IPsec SA.
     * @type {Pointer<FWPM_FILTER0>}
     */
    transportFilter {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * An [IPSEC_VIRTUAL_IF_TUNNEL_INFO0](/windows/desktop/api/fwptypes/ns-fwptypes-ipsec_virtual_if_tunnel_info0) structure that specifies the virtual interface tunnel information. Only supported by Internet Key Exchange version 2 (IKEv2).
     * @type {IPSEC_VIRTUAL_IF_TUNNEL_INFO0}
     */
    virtualIfTunnelInfo{
        get {
            if(!this.HasProp("__virtualIfTunnelInfo"))
                this.__virtualIfTunnelInfo := IPSEC_VIRTUAL_IF_TUNNEL_INFO0(this.ptr + 184)
            return this.__virtualIfTunnelInfo
        }
    }
}
