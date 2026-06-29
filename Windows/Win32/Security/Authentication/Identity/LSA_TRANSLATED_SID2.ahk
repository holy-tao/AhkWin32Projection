#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\SID_NAME_USE.ahk" { SID_NAME_USE }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Contains SIDs that are retrieved based on account names.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_translated_sid2
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_TRANSLATED_SID2 {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration value that identifies the use of the SID. If this value is SidTypeUnknown or SidTypeInvalid, the rest of the information in the structure is not valid and should be ignored.
     */
    Use : SID_NAME_USE

    /**
     * The complete SID of the account.
     */
    Sid : PSID

    /**
     * The index of an entry in a related 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> data structure which describes the domain that owns the account. If there is no corresponding reference domain for an entry, then <b>DomainIndex</b> will contain a negative value.
     */
    DomainIndex : Int32

    /**
     * Not used.
     */
    Flags : UInt32

}
