#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains SIDs that are retrieved based on account names.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_translated_sid2
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_TRANSLATED_SID2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration value that identifies the use of the SID. If this value is SidTypeUnknown or SidTypeInvalid, the rest of the information in the structure is not valid and should be ignored.
     * @type {Integer}
     */
    Use {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The complete SID of the account.
     * @type {PSID}
     */
    Sid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The index of an entry in a related 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_referenced_domain_list">LSA_REFERENCED_DOMAIN_LIST</a> data structure which describes the domain that owns the account. If there is no corresponding reference domain for an entry, then <b>DomainIndex</b> will contain a negative value.
     * @type {Integer}
     */
    DomainIndex {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
