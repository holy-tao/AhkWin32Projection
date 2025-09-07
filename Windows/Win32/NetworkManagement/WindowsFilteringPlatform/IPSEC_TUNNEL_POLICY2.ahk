#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_TUNNEL_ENDPOINTS2.ahk
#Include .\IPSEC_SA_IDLE_TIMEOUT0.ahk

/**
 * Stores the quick mode negotiation policy for tunnel mode IPsec. (IPSEC_TUNNEL_POLICY2)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_policy2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TUNNEL_POLICY2 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>UINT32</b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     *  Number of quick mode proposals in the policy.
     * @type {Integer}
     */
    numIpsecProposals {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: [IPSEC_PROPOSAL0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_proposal0)*</b>
     * 
     * Array of quick mode proposals.
     * @type {Pointer<IPSEC_PROPOSAL0>}
     */
    ipsecProposals {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: [IPSEC_TUNNEL_ENDPOINTS2](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints2)</b>
     * 
     * Tunnel endpoints of the IPsec security association (SA) generated from this policy.
     * @type {IPSEC_TUNNEL_ENDPOINTS2}
     */
    tunnelEndpoints{
        get {
            if(!this.HasProp("__tunnelEndpoints"))
                this.__tunnelEndpoints := IPSEC_TUNNEL_ENDPOINTS2(this.ptr + 16)
            return this.__tunnelEndpoints
        }
    }

    /**
     * Type: [IPSEC_SA_IDLE_TIMEOUT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_idle_timeout0)</b>
     * 
     * Specifies the SA idle timeout in IPsec policy.
     * @type {IPSEC_SA_IDLE_TIMEOUT0}
     */
    saIdleTimeout{
        get {
            if(!this.HasProp("__saIdleTimeout"))
                this.__saIdleTimeout := IPSEC_SA_IDLE_TIMEOUT0(this.ptr + 64)
            return this.__saIdleTimeout
        }
    }

    /**
     * Type: [IKEEXT_EM_POLICY2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_em_policy2)*</b>
     * 
     * The AuthIP extended mode authentication policy.
     * @type {Pointer<IKEEXT_EM_POLICY2>}
     */
    emPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The forward path SA lifetime indicating the length of time for this connection.
     * @type {Integer}
     */
    fwdPathSaLifetime {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
