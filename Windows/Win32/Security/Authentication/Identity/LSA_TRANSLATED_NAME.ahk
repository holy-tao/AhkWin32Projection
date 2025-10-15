#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Used with the LsaLookupSids function to return information about the account identified by a SID.
 * @see https://docs.microsoft.com/windows/win32/api//lsalookup/ns-lsalookup-lsa_translated_name
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_TRANSLATED_NAME extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration that identifies the type of SID.
     * @type {Integer}
     */
    Use {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the isolated name of the translated SID. An isolated name is a user, group, or local group account name without the domain name (for example, user_name, rather than Acctg\user_name).
     * @type {LSA_UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__Name
        }
    }

    /**
     * Specifies the zero-based index of an entry in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> structure returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalookupsids">LsaLookupSids</a> function. The entry contains the name and SID of the domain in which the account was found. 
     * 
     * 
     * 
     * 
     * If there is no corresponding domain for an account, this member contains a negative value.
     * @type {Integer}
     */
    DomainIndex {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
