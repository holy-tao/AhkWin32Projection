#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_SA_LIFETIME0.ahk" { IPSEC_SA_LIFETIME0 }
#Import ".\IPSEC_PFS_GROUP.ahk" { IPSEC_PFS_GROUP }
#Import ".\IPSEC_SA_TRANSFORM0.ahk" { IPSEC_SA_TRANSFORM0 }

/**
 * Used to store an IPsec quick mode proposal.
 * @remarks
 * The proposal describes the
 * various parameters of the IPsec SA that is potentially generated from this
 * proposal.
 * 
 * <b>IPSEC_PROPOSAL0</b> is a specific implementation of IPSEC_PROPOSAL. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_proposal0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_PROPOSAL0 {
    #StructPack 8

    /**
     * Lifetime of the IPsec security association (SA) as specified by [IPSEC_SA_LIFETIME0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_lifetime0). Cannot be zero.
     */
    lifetime : IPSEC_SA_LIFETIME0

    /**
     * Number of IPsec SA transforms. The only possible values are 1 and 2. Use 2 only when specifying AH plus ESP transforms.
     */
    numSaTransforms : UInt32

    /**
     * Array of IPsec SA transforms as specified by [IPSEC_SA_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_transform0).
     */
    saTransforms : IPSEC_SA_TRANSFORM0.Ptr

    /**
     * Perfect forward secrecy (PFS) group of the IPsec SA as specified by [IPSEC_PFS_GROUP](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_pfs_group).
     */
    pfsGroup : IPSEC_PFS_GROUP

}
