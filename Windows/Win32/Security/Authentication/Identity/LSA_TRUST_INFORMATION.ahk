#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSID.ahk

/**
 * Identifies a domain.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms722475(v=vs.85)">TRUSTED_DOMAIN_INFORMATION_BASIC</a> is an alias for this structure.
  * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms722475(v=vs.85)">TRUSTED_DOMAIN_INFORMATION_BASIC</a> structure identifies a domain. This structure is used by the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaquerytrusteddomaininfo">LsaQueryTrustedDomainInfo</a> function when its <i>InformationClass</i> parameter is set to <b>TrustedDomainInformationBasic</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lsalookup/ns-lsalookup-lsa_trust_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_TRUST_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the domain.
     * @type {LSA_UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * Pointer to the SID of the domain.
     * @type {PSID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := PSID(this.ptr + 16)
            return this.__Sid
        }
    }
}
