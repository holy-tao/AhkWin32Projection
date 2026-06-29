#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the IKEv2 main mode and quick mode policy configuration.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-router_custom_ikev2_policy0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct ROUTER_CUSTOM_IKEv2_POLICY0 {
    #StructPack 4

    /**
     * A value that specifies the integrity algorithm to be negotiated during IKEv2 main mode SA negotiation. The allowed values for this member are defined in [IKEEXT_INTEGRITY_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_integrity_type).
     */
    dwIntegrityMethod : UInt32

    /**
     * A value that specifies the encryption algorithm to be negotiated during IKEv2 main mode SA negotiation. The allowed valued for this member are defined in [IKEEXT_CIPHER_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cipher_type).
     */
    dwEncryptionMethod : UInt32

    /**
     * A value that specifies the encryption algorithm to be negotiated during IKEv2 quick mode SA negotiation. The allowed valued for this member are defined in [IPSEC_CIPHER_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_cipher_type).
     */
    dwCipherTransformConstant : UInt32

    /**
     * A value that specifies the hash algorithm to be negotiated during IKEv2 quick mode SA negotiation. The allowed valued for this member are defined in [IPSEC_AUTH_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_auth_type).
     */
    dwAuthTransformConstant : UInt32

    /**
     * A value that specifies the Diffie Hellman algorithm that should be used for Quick Mode PFS (Perfect Forward Secrecy). The allowed valued for this member are defined in [IPSEC_PFS_GROUP](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_pfs_group).
     */
    dwPfsGroup : UInt32

    /**
     * A value that specifies the type of Diffie Hellman group used for Internet Key Exchange (IKE) key generation during MM SA negotiation. The allowed valued for this member are defined in [IKEEXT_DH_GROUP](/windows/desktop/api/iketypes/ne-iketypes-ikeext_dh_group).
     */
    dwDhGroup : UInt32

}
