#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_TRAFFIC0.ahk" { IKEEXT_TRAFFIC0 }
#Import ".\IKEEXT_INTEGRITY_TYPE.ahk" { IKEEXT_INTEGRITY_TYPE }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IKEEXT_DH_GROUP.ahk" { IKEEXT_DH_GROUP }
#Import ".\IKEEXT_KEY_MODULE_TYPE.ahk" { IKEEXT_KEY_MODULE_TYPE }
#Import ".\IKEEXT_INTEGRITY_ALGORITHM0.ahk" { IKEEXT_INTEGRITY_ALGORITHM0 }
#Import ".\IPSEC_V4_UDP_ENCAPSULATION0.ahk" { IPSEC_V4_UDP_ENCAPSULATION0 }
#Import ".\IKEEXT_COOKIE_PAIR0.ahk" { IKEEXT_COOKIE_PAIR0 }
#Import ".\IKEEXT_CIPHER_TYPE.ahk" { IKEEXT_CIPHER_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKEEXT_CREDENTIAL_PAIR2.ahk" { IKEEXT_CREDENTIAL_PAIR2 }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import ".\IKEEXT_CIPHER_ALGORITHM0.ahk" { IKEEXT_CIPHER_ALGORITHM0 }
#Import ".\IKEEXT_CREDENTIALS2.ahk" { IKEEXT_CREDENTIALS2 }
#Import ".\IKEEXT_PROPOSAL0.ahk" { IKEEXT_PROPOSAL0 }

/**
 * Is used to store information returned when enumerating IKE, AuthIP, and IKEv2 security associations (SAs). (IKEEXT_SA_DETAILS2)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_sa_details2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_SA_DETAILS2 {
    #StructPack 8

    /**
     * Type: <b>UINT64</b>
     * 
     * LUID identifying the security association.
     */
    saId : Int64

    /**
     * Type: [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type)</b>
     * 
     * Key module type.
     */
    keyModuleType : IKEEXT_KEY_MODULE_TYPE

    /**
     * Type: [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version)</b>
     * 
     *  The IP version.
     */
    ipVersion : FWP_IP_VERSION

    v4UdpEncapsulation : IPSEC_V4_UDP_ENCAPSULATION0.Ptr

    /**
     * Type: [IKEEXT_TRAFFIC0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_traffic0)</b>
     * 
     * The traffic corresponding to this IKE SA.
     */
    ikeTraffic : IKEEXT_TRAFFIC0

    /**
     * Type: [IKEEXT_PROPOSAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_proposal0)</b>
     * 
     * The main mode proposal corresponding to this IKE SA.
     */
    ikeProposal : IKEEXT_PROPOSAL0

    /**
     * Type: [IKEEXT_COOKIE_PAIR0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cookie_pair0)</b>
     * 
     * The SA cookies.
     */
    cookiePair : IKEEXT_COOKIE_PAIR0

    /**
     * Type: [IKEEXT_CREDENTIALS2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credentials2)</b>
     * 
     * Credentials information for the SA.
     */
    ikeCredentials : IKEEXT_CREDENTIALS2

    /**
     * Type: <b>GUID</b>
     * 
     * GUID of the main mode policy provider context corresponding to this SA.
     */
    ikePolicyKey : Guid

    /**
     * Type: <b>UINT64</b>
     * 
     * ID/Handle to virtual interface tunneling state. Applicable only to IKEv2.
     */
    virtualIfTunnelId : Int64

    /**
     * Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)</b>
     * 
     * Key derived from authentications to allow external applications to cryptographically bind
     *    their exchanges with this SA.
     */
    correlationKey : FWP_BYTE_BLOB

}
