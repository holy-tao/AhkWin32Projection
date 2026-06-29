#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_CIPHER_TYPE.ahk" { IKEEXT_CIPHER_TYPE }
#Import ".\IKEEXT_INTEGRITY_ALGORITHM0.ahk" { IKEEXT_INTEGRITY_ALGORITHM0 }
#Import ".\IKEEXT_INTEGRITY_TYPE.ahk" { IKEEXT_INTEGRITY_TYPE }
#Import ".\IKEEXT_CIPHER_ALGORITHM0.ahk" { IKEEXT_CIPHER_ALGORITHM0 }
#Import ".\IKEEXT_DH_GROUP.ahk" { IKEEXT_DH_GROUP }

/**
 * Is used to store an IKE/AuthIP main mode proposal.
 * @remarks
 * The proposal describes the
 * various parameters of the IKE/AuthIP main mode SA that is potentially generated
 * from this proposal.
 * 
 * <b>IKEEXT_PROPOSAL0</b> is a specific implementation of IKEEXT_PROPOSAL. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_proposal0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_PROPOSAL0 {
    #StructPack 4

    /**
     * Parameters for the encryption algorithm specified by [IKEEXT_CIPHER_ALGORITHM0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cipher_algorithm0).
     */
    cipherAlgorithm : IKEEXT_CIPHER_ALGORITHM0

    /**
     * Parameters for the hash algorithm specified by [IKEEXT_INTEGRITY_ALGORITHM0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_integrity_algorithm0).
     */
    integrityAlgorithm : IKEEXT_INTEGRITY_ALGORITHM0

    /**
     * Main mode security association (SA) lifetime in seconds.
     */
    maxLifetimeSeconds : UInt32

    /**
     * The Diffie Hellman group specified by [IKEEXT_DH_GROUP](/windows/desktop/api/iketypes/ne-iketypes-ikeext_dh_group).
     */
    dhGroup : IKEEXT_DH_GROUP

    /**
     * Maximum number of IPsec quick mode SAs that can be generated from this
     *    main mode SA. 0 (zero) means infinite.
     */
    quickModeLimit : UInt32

}
