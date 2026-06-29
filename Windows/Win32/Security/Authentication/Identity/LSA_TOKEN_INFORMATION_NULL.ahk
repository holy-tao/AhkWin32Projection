#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\TOKEN_GROUPS.ahk" { TOKEN_GROUPS }

/**
 * Used in cases where a non-authenticated system access is needed.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-lsa_token_information_null
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_TOKEN_INFORMATION_NULL {
    #StructPack 8

    /**
     * Time at which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> becomes not valid. Use a value in the distant future if the context never expires.
     */
    ExpirationTime : Int64

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs) of groups the user is to be made a member of. This should not include WORLD or other SIDs defined and assigned by the system. 
     * 
     * 
     * 
     * 
     * Each SID is expected to be in a separately allocated block of memory. The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure is also expected to be in a separately allocated block of memory.
     */
    Groups : TOKEN_GROUPS.Ptr

}
