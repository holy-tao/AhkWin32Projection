#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSID.ahk

/**
 * Used to set and query the name and SID of the system's account domain.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-policy_account_domain_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_ACCOUNT_DOMAIN_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the name of the account domain.
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__DomainName
        }
    }

    /**
     * Pointer to the SID of the account domain.
     * @type {PSID}
     */
    DomainSid{
        get {
            if(!this.HasProp("__DomainSid"))
                this.__DomainSid := PSID(this.ptr + 16)
            return this.__DomainSid
        }
    }
}
