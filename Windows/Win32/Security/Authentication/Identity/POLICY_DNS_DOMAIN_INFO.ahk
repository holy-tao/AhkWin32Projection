#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSID.ahk

/**
 * The POLICY_DNS_DOMAIN_INFO structure is used to set and query Domain Name System (DNS) information about the primary domain associated with a Policy object.
 * @remarks
 * 
  * The <b>POLICY_DNS_DOMAIN_INFO</b> structure is an extended version of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_primary_domain_info">POLICY_PRIMARY_DOMAIN_INFO</a> structure. Setting <b>POLICY_DNS_DOMAIN_INFO</b> information will overwrite the corresponding values in the <b>POLICY_PRIMARY_DOMAIN_INFO</b> (name and SID), and vice versa.
  * 
  * If the computer associated with the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object is not a member of a domain, all structure members except <b>Name</b> are <b>NULL</b> or zero.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lsalookup/ns-lsalookup-policy_dns_domain_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_DNS_DOMAIN_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the name of the primary domain. This is the same as the primary domain name in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_primary_domain_info">POLICY_PRIMARY_DOMAIN_INFO</a> structure.
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
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the DNS name of the primary domain.
     * @type {LSA_UNICODE_STRING}
     */
    DnsDomainName{
        get {
            if(!this.HasProp("__DnsDomainName"))
                this.__DnsDomainName := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__DnsDomainName
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the DNS forest name of the primary domain. This is the DNS name of the domain at the root of the enterprise.
     * @type {LSA_UNICODE_STRING}
     */
    DnsForestName{
        get {
            if(!this.HasProp("__DnsForestName"))
                this.__DnsForestName := LSA_UNICODE_STRING(this.ptr + 32)
            return this.__DnsForestName
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that contains the GUID of the primary domain.
     * @type {Pointer<Guid>}
     */
    DomainGuid {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the SID of the primary domain. This is the same as the primary domain SID in the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_primary_domain_info">POLICY_PRIMARY_DOMAIN_INFO</a> structure.
     * @type {PSID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := PSID(this.ptr + 56)
            return this.__Sid
        }
    }
}
