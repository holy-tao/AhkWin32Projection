#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\SID_NAME_USE.ahk" { SID_NAME_USE }

/**
 * Used with the LsaLookupSids function to return information about the account identified by a SID.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_translated_name
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_TRANSLATED_NAME {
    #StructPack 8

    /**
     * A value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration that identifies the type of SID.
     */
    Use : SID_NAME_USE

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the isolated name of the translated SID. An isolated name is a user, group, or local group account name without the domain name (for example, user_name, rather than Acctg\user_name).
     */
    Name : LSA_UNICODE_STRING

    /**
     * Specifies the zero-based index of an entry in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupsids">LsaLookupSids</a> function. The entry contains the name and SID of the domain in which the account was found. 
     * 
     * 
     * 
     * 
     * If there is no corresponding domain for an account, this member contains a negative value.
     */
    DomainIndex : Int32

}
