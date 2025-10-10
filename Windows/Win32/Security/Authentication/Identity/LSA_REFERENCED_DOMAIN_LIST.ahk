#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The LSA_REFERENCED_DOMAIN_LIST structure contains information about the domains referenced in a lookup operation.
 * @see https://docs.microsoft.com/windows/win32/api//lsalookup/ns-lsalookup-lsa_referenced_domain_list
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_REFERENCED_DOMAIN_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of entries in the <b>Domains</b> array.
     * @type {Integer}
     */
    Entries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_trust_information">LSA_TRUST_INFORMATION</a> structures that identify the referenced domains.
     * @type {Pointer<LSA_TRUST_INFORMATION>}
     */
    Domains {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
