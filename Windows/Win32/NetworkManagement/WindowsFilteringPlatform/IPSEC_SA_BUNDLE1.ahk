#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_SA_LIFETIME0.ahk" { IPSEC_SA_LIFETIME0 }
#Import ".\IPSEC_KEYMODULE_STATE0.ahk" { IPSEC_KEYMODULE_STATE0 }
#Import ".\IPSEC_SA_BUNDLE_FLAGS.ahk" { IPSEC_SA_BUNDLE_FLAGS }
#Import ".\IPSEC_PFS_GROUP.ahk" { IPSEC_PFS_GROUP }
#Import ".\IPSEC_ID0.ahk" { IPSEC_ID0 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import ".\IPSEC_SA0.ahk" { IPSEC_SA0 }

/**
 * Is used to store information about an IPsec security association (SA) bundle. (IPSEC_SA_BUNDLE1)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_BUNDLE1 {
    #StructPack 8

    flags : IPSEC_SA_BUNDLE_FLAGS

    /**
     * Lifetime of all the SAs in the bundle as specified by [IPSEC_SA_LIFETIME0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_lifetime0).
     */
    lifetime : IPSEC_SA_LIFETIME0

    /**
     * Timeout in seconds after which the SAs in the bundle will idle out (due to traffic inactivity) and expire.
     */
    idleTimeoutSeconds : UInt32

    /**
     * Timeout in seconds, after which the IPsec SA should stop accepting
     *    packets coming in the clear. 
     * 
     * Used for negotiation discovery.
     */
    ndAllowClearTimeoutSeconds : UInt32

    /**
     * Pointer to an [IPSEC_ID0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_id0) structure that contains optional IPsec identity info.
     */
    ipsecId : IPSEC_ID0.Ptr

    /**
     * Network Access Point (NAP) peer credentials information.
     */
    napContext : UInt32

    /**
     * SA identifier used by IPsec when choosing the SA to expire.  For an IPsec SA pair, the <b>qmSaId</b> must be the same between the initiating and responding machines and across inbound and outbound SA bundles.  For different IPsec pairs, the <b>qmSaId</b> must be different.
     */
    qmSaId : UInt32

    /**
     * Number of SAs in the bundle. The only possible values are 1 and 2. Use 2 only when specifying AH and ESP SAs.
     */
    numSAs : UInt32

    /**
     * Array of IPsec SAs in the bundle. For AH and ESP SAs, use index 0 for ESP SA and index 1 for AH SA.
     * 
     * 
     * 
     * See [IPSEC_SA0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa0) for more information.
     */
    saList : IPSEC_SA0.Ptr

    /**
     * Optional keying module specific information as specified by [IPSEC_KEYMODULE_STATE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_keymodule_state0).
     */
    keyModuleState : IPSEC_KEYMODULE_STATE0.Ptr

    /**
     * IP version as specified by [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version).
     */
    ipVersion : FWP_IP_VERSION

    peerV4PrivateAddress : UInt32

    /**
     * Use this ID to correlate this IPsec SA with the IKE SA that generated it.
     */
    mmSaId : Int64

    /**
     * Specifies whether Quick Mode perfect forward secrecy (PFS) was enabled for
     *    this SA, and if so, contains the Diffie-Hellman group that was used for
     *    PFS.
     * 
     * See [IPSEC_PFS_GROUP](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_pfs_group) for more information.
     */
    pfsGroup : IPSEC_PFS_GROUP

    /**
     * SA lookup context which is propagated from the SA to data connections flowing over that SA. It is made available to any application that queries socket security properties using the Winsock API <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function, allowing the application to obtain detailed IPsec authentication information for its connection.
     */
    saLookupContext : Guid

    qmFilterId : Int64

}
