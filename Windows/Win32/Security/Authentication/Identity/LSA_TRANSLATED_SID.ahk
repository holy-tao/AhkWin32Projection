#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\SID_NAME_USE.ahk" { SID_NAME_USE }

/**
 * Used with the LsaLookupNames function to return information about the SID that identifies an account.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_translated_sid
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_TRANSLATED_SID {
    #StructPack 4

    /**
     * A value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration type that identifies the type of SID.
     */
    Use : SID_NAME_USE

    /**
     * Specifies the relative identifier (RID) of the account's SID. The RID identifies the account relative to the domain referenced by the <b>DomainIndex</b> member. The account's complete SID consists of the domain SID followed by the RID.
     */
    RelativeId : UInt32

    /**
     * Specifies the zero-based index of an entry in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupnames">LsaLookupNames</a> function. This entry contains the name and SID of the domain in which the account was found. 
     * 
     * 
     * 
     * 
     * If there is no corresponding domain for an account, this member contains a negative value.
     */
    DomainIndex : Int32

}
