#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_TRUST_INFORMATION.ahk" { LSA_TRUST_INFORMATION }

/**
 * The LSA_REFERENCED_DOMAIN_LIST structure contains information about the domains referenced in a lookup operation.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_REFERENCED_DOMAIN_LIST {
    #StructPack 8

    /**
     * Specifies the number of entries in the <b>Domains</b> array.
     */
    Entries : UInt32

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_trust_information">LSA_TRUST_INFORMATION</a> structures that identify the referenced domains.
     */
    Domains : LSA_TRUST_INFORMATION.Ptr

}
