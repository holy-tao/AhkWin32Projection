#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_SA_LIFETIME0.ahk

/**
 * Is used to store information about an IPsec security association (SA) bundle. (IPSEC_SA_BUNDLE1)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_BUNDLE1 extends Win32Struct
{
    static sizeof => 112

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
     * Lifetime of all the SAs in the bundle as specified by [IPSEC_SA_LIFETIME0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_lifetime0).
     * @type {IPSEC_SA_LIFETIME0}
     */
    lifetime{
        get {
            if(!this.HasProp("__lifetime"))
                this.__lifetime := IPSEC_SA_LIFETIME0(8, this)
            return this.__lifetime
        }
    }

    /**
     * Timeout in seconds after which the SAs in the bundle will idle out (due to traffic inactivity) and expire.
     * @type {Integer}
     */
    idleTimeoutSeconds {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Timeout in seconds, after which the IPsec SA should stop accepting
     *    packets coming in the clear. 
     * 
     * Used for negotiation discovery.
     * @type {Integer}
     */
    ndAllowClearTimeoutSeconds {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to an [IPSEC_ID0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_id0) structure that contains optional IPsec identity info.
     * @type {Pointer<IPSEC_ID0>}
     */
    ipsecId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Network Access Point (NAP) peer credentials information.
     * @type {Integer}
     */
    napContext {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * SA identifier used by IPsec when choosing the SA to expire.  For an IPsec SA pair, the <b>qmSaId</b> must be the same between the initiating and responding machines and across inbound and outbound SA bundles.  For different IPsec pairs, the <b>qmSaId</b> must be different.
     * @type {Integer}
     */
    qmSaId {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Number of SAs in the bundle. The only possible values are 1 and 2. Use 2 only when specifying AH and ESP SAs.
     * @type {Integer}
     */
    numSAs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Array of IPsec SAs in the bundle. For AH and ESP SAs, use index 0 for ESP SA and index 1 for AH SA.
     * 
     * 
     * 
     * See [IPSEC_SA0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa0) for more information.
     * @type {Pointer<IPSEC_SA0>}
     */
    saList {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Optional keying module specific information as specified by [IPSEC_KEYMODULE_STATE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_keymodule_state0).
     * @type {Pointer<IPSEC_KEYMODULE_STATE0>}
     */
    keyModuleState {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * IP version as specified by [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version).
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    peerV4PrivateAddress {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Use this ID to correlate this IPsec SA with the IKE SA that generated it.
     * @type {Integer}
     */
    mmSaId {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Specifies whether Quick Mode perfect forward secrecy (PFS) was enabled for
     *    this SA, and if so, contains the Diffie-Hellman group that was used for
     *    PFS.
     * 
     * See [IPSEC_PFS_GROUP](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_pfs_group) for more information.
     * @type {Integer}
     */
    pfsGroup {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * SA lookup context which is propagated from the SA to data connections flowing over that SA. It is made available to any application that queries socket security properties using the Winsock API <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function, allowing the application to obtain detailed IPsec authentication information for its connection.
     * @type {Pointer<Guid>}
     */
    saLookupContext {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * 
     * @type {Integer}
     */
    qmFilterId {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
