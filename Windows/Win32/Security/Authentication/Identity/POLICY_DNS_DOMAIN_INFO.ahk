#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The POLICY_DNS_DOMAIN_INFO structure is used to set and query Domain Name System (DNS) information about the primary domain associated with a Policy object.
 * @remarks
 * The <b>POLICY_DNS_DOMAIN_INFO</b> structure is an extended version of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_primary_domain_info">POLICY_PRIMARY_DOMAIN_INFO</a> structure. Setting <b>POLICY_DNS_DOMAIN_INFO</b> information will overwrite the corresponding values in the <b>POLICY_PRIMARY_DOMAIN_INFO</b> (name and SID), and vice versa.
 * 
 * If the computer associated with the <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/policy-object">Policy</a> object is not a member of a domain, all structure members except <b>Name</b> are <b>NULL</b> or zero.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-policy_dns_domain_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_DNS_DOMAIN_INFO {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the name of the primary domain. This is the same as the primary domain name in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_primary_domain_info">POLICY_PRIMARY_DOMAIN_INFO</a> structure.
     */
    Name : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the DNS name of the primary domain.
     */
    DnsDomainName : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the DNS forest name of the primary domain. This is the DNS name of the domain at the root of the enterprise.
     */
    DnsForestName : LSA_UNICODE_STRING

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that contains the GUID of the primary domain.
     */
    DomainGuid : Guid

    /**
     * Pointer to the SID of the primary domain. This is the same as the primary domain SID in the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-policy_primary_domain_info">POLICY_PRIMARY_DOMAIN_INFO</a> structure.
     */
    Sid : PSID

}
