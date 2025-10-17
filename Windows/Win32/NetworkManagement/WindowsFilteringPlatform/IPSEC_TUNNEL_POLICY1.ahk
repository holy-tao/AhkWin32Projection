#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_TUNNEL_ENDPOINTS1.ahk
#Include .\IPSEC_SA_IDLE_TIMEOUT0.ahk

/**
 * Stores the quick mode negotiation policy for tunnel mode IPsec.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_tunnel_policy1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TUNNEL_POLICY1 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of quick mode proposals in the policy.
     * @type {Integer}
     */
    numIpsecProposals {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of quick mode proposals.
     * 
     * See [IPSEC_PROPOSAL0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_proposal0) for more information.
     * @type {Pointer<IPSEC_PROPOSAL0>}
     */
    ipsecProposals {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Tunnel endpoints of the IPsec security association (SA) generated from this policy.
     * 
     * See [IPSEC_TUNNEL_ENDPOINTS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints1) for more information.
     * @type {IPSEC_TUNNEL_ENDPOINTS1}
     */
    tunnelEndpoints{
        get {
            if(!this.HasProp("__tunnelEndpoints"))
                this.__tunnelEndpoints := IPSEC_TUNNEL_ENDPOINTS1(16, this)
            return this.__tunnelEndpoints
        }
    }

    /**
     * An [IPSEC_SA_IDLE_TIMEOUT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_idle_timeout0) structure that specifies the SA idle timeout in IPsec policy.
     * @type {IPSEC_SA_IDLE_TIMEOUT0}
     */
    saIdleTimeout{
        get {
            if(!this.HasProp("__saIdleTimeout"))
                this.__saIdleTimeout := IPSEC_SA_IDLE_TIMEOUT0(64, this)
            return this.__saIdleTimeout
        }
    }

    /**
     * The AuthIP extended mode authentication policy.
     * 
     * See [IKEEXT_EM_POLICY1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_em_policy1) for more information.
     * @type {Pointer<IKEEXT_EM_POLICY1>}
     */
    emPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
