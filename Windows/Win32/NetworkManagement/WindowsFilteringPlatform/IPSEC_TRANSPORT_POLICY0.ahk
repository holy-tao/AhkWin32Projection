#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_SA_IDLE_TIMEOUT0.ahk

/**
 * Stores the quick mode negotiation policy for transport mode IPsec. (IPSEC_TRANSPORT_POLICY0)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_transport_policy0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TRANSPORT_POLICY0 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Number of quick mode proposals in the policy.
     * @type {Integer}
     */
    numIpsecProposals {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
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
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Timeout in seconds, after which the IPsec security association (SA) should stop accepting
     *    packets coming in the clear. Used for negotiation discovery.
     * @type {Integer}
     */
    ndAllowClearTimeoutSeconds {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An [IPSEC_SA_IDLE_TIMEOUT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_idle_timeout0) structure that specifies the SA idle timeout in IPsec policy.
     * @type {IPSEC_SA_IDLE_TIMEOUT0}
     */
    saIdleTimeout{
        get {
            if(!this.HasProp("__saIdleTimeout"))
                this.__saIdleTimeout := IPSEC_SA_IDLE_TIMEOUT0(24, this)
            return this.__saIdleTimeout
        }
    }

    /**
     * The AuthIP extended mode authentication policy.
     * 
     * See [IKEEXT_EM_POLICY0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_em_policy0) for more information.
     * @type {Pointer<IKEEXT_EM_POLICY0>}
     */
    emPolicy {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
