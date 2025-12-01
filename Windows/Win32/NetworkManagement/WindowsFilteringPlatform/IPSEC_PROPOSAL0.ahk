#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_SA_LIFETIME0.ahk

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
 * @version v4.0.30319
 */
class IPSEC_PROPOSAL0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Lifetime of the IPsec security association (SA) as specified by [IPSEC_SA_LIFETIME0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_lifetime0). Cannot be zero.
     * @type {IPSEC_SA_LIFETIME0}
     */
    lifetime{
        get {
            if(!this.HasProp("__lifetime"))
                this.__lifetime := IPSEC_SA_LIFETIME0(0, this)
            return this.__lifetime
        }
    }

    /**
     * Number of IPsec SA transforms. The only possible values are 1 and 2. Use 2 only when specifying AH plus ESP transforms.
     * @type {Integer}
     */
    numSaTransforms {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Array of IPsec SA transforms as specified by [IPSEC_SA_TRANSFORM0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_transform0).
     * @type {Pointer<IPSEC_SA_TRANSFORM0>}
     */
    saTransforms {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Perfect forward secrecy (PFS) group of the IPsec SA as specified by [IPSEC_PFS_GROUP](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_pfs_group).
     * @type {Integer}
     */
    pfsGroup {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
