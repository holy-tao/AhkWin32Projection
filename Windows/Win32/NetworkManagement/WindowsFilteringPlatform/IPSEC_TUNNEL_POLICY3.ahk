#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_TUNNEL_ENDPOINTS2.ahk
#Include .\IPSEC_SA_IDLE_TIMEOUT0.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TUNNEL_POLICY3 extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    numIpsecProposals {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<IPSEC_PROPOSAL0>}
     */
    ipsecProposals {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
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
     * @type {IPSEC_SA_IDLE_TIMEOUT0}
     */
    saIdleTimeout{
        get {
            if(!this.HasProp("__saIdleTimeout"))
                this.__saIdleTimeout := IPSEC_SA_IDLE_TIMEOUT0(this.ptr + 88)
            return this.__saIdleTimeout
        }
    }

    /**
     * @type {Pointer<IKEEXT_EM_POLICY2>}
     */
    emPolicy {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    fwdPathSaLifetime {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    compartmentId {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    numTrafficSelectorPolicy {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Pointer<IPSEC_TRAFFIC_SELECTOR_POLICY0>}
     */
    trafficSelectorPolicies {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }
}
