#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_POLICY_MAPPING.ahk" { CERT_POLICY_MAPPING }

/**
 * The CERT_POLICY_MAPPINGS_INFO structure provides mapping between the policy OIDs of two domains.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policy_mappings_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY_MAPPINGS_INFO {
    #StructPack 8

    /**
     * Count of the number of elements in the <b>rgPolicyMapping</b> array.
     */
    cPolicyMapping : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_policy_mapping">CERT_POLICY_MAPPING</a> structures. Each element of this array provides pair of OIDs mapping the identifies of one domain to identifiers in the other domain.
     */
    rgPolicyMapping : CERT_POLICY_MAPPING.Ptr

}
