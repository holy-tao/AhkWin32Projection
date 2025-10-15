#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains identifying information for a domain.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-lsa_forest_trust_domain_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_FOREST_TRUST_DOMAIN_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> of the domain.
     * @type {PSID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := PSID(this.ptr + 0)
            return this.__Sid
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the DNS name of the domain.
     * @type {LSA_UNICODE_STRING}
     */
    DnsName{
        get {
            if(!this.HasProp("__DnsName"))
                this.__DnsName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__DnsName
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the NetBIOS name of the domain.
     * @type {LSA_UNICODE_STRING}
     */
    NetbiosName{
        get {
            if(!this.HasProp("__NetbiosName"))
                this.__NetbiosName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__NetbiosName
        }
    }
}
