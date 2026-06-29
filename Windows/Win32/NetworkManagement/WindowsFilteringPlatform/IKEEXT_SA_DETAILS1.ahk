#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_TRAFFIC0.ahk" { IKEEXT_TRAFFIC0 }
#Import ".\IKEEXT_CREDENTIALS1.ahk" { IKEEXT_CREDENTIALS1 }
#Import ".\IKEEXT_INTEGRITY_TYPE.ahk" { IKEEXT_INTEGRITY_TYPE }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IKEEXT_DH_GROUP.ahk" { IKEEXT_DH_GROUP }
#Import ".\IKEEXT_KEY_MODULE_TYPE.ahk" { IKEEXT_KEY_MODULE_TYPE }
#Import ".\IKEEXT_CREDENTIAL_PAIR1.ahk" { IKEEXT_CREDENTIAL_PAIR1 }
#Import ".\IKEEXT_INTEGRITY_ALGORITHM0.ahk" { IKEEXT_INTEGRITY_ALGORITHM0 }
#Import ".\IPSEC_V4_UDP_ENCAPSULATION0.ahk" { IPSEC_V4_UDP_ENCAPSULATION0 }
#Import ".\IKEEXT_COOKIE_PAIR0.ahk" { IKEEXT_COOKIE_PAIR0 }
#Import ".\IKEEXT_CIPHER_TYPE.ahk" { IKEEXT_CIPHER_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import ".\IKEEXT_CIPHER_ALGORITHM0.ahk" { IKEEXT_CIPHER_ALGORITHM0 }
#Import ".\IKEEXT_PROPOSAL0.ahk" { IKEEXT_PROPOSAL0 }

/**
 * Is used to store information returned when enumerating IKE, AuthIP, and IKEv2 security associations (SAs). (IKEEXT_SA_DETAILS1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_sa_details1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_SA_DETAILS1 {
    #StructPack 8

    /**
     * LUID identifying the security association.
     */
    saId : Int64

    /**
     * Key module type. 
     * 
     * See [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type) for more information.
     */
    keyModuleType : IKEEXT_KEY_MODULE_TYPE

    /**
     * IP version specified by [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version).
     */
    ipVersion : FWP_IP_VERSION

    v4UdpEncapsulation : IPSEC_V4_UDP_ENCAPSULATION0.Ptr

    /**
     * The traffic corresponding to this IKE SA specified by [IKEEXT_TRAFFIC0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_traffic0).
     */
    ikeTraffic : IKEEXT_TRAFFIC0

    /**
     * The main mode proposal corresponding to this IKE SA specified by [IKEEXT_PROPOSAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_proposal0).
     */
    ikeProposal : IKEEXT_PROPOSAL0

    /**
     * SA cookies specified by [IKEEXT_COOKIE_PAIR0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cookie_pair0).
     */
    cookiePair : IKEEXT_COOKIE_PAIR0

    /**
     * Credentials information for the SA specified by [IKEEXT_CREDENTIALS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credentials1).
     */
    ikeCredentials : IKEEXT_CREDENTIALS1

    /**
     * GUID of the main mode policy provider context corresponding to this SA.
     */
    ikePolicyKey : Guid

    /**
     * ID/Handle to virtual interface tunneling state. Applicable only to IKEv2.
     */
    virtualIfTunnelId : Int64

    correlationKey : FWP_BYTE_BLOB

}
