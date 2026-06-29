#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRUSTED_DOMAIN_TRUST_TYPE.ahk" { TRUSTED_DOMAIN_TRUST_TYPE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\TRUSTED_DOMAIN_TRUST_ATTRIBUTES.ahk" { TRUSTED_DOMAIN_TRUST_ATTRIBUTES }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\TRUSTED_DOMAIN_TRUST_DIRECTION.ahk" { TRUSTED_DOMAIN_TRUST_DIRECTION }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Used to retrieve extended information about a trusted domain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_INFORMATION_EX {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the trusted domain. This is the DNS domain name.  For non-Microsoft trusted domains, this is the identifying name of the domain.
     */
    Name : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the flat name of the trusted domain. For non-Microsoft trusted domains, this is the identifying name of the domain or it is <b>NULL</b>.
     */
    FlatName : LSA_UNICODE_STRING

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the trusted domain. For non-Microsoft trusted domains, this member can be <b>NULL</b>.
     */
    Sid : PSID

    TrustDirection : TRUSTED_DOMAIN_TRUST_DIRECTION

    TrustType : TRUSTED_DOMAIN_TRUST_TYPE

    TrustAttributes : TRUSTED_DOMAIN_TRUST_ATTRIBUTES

}
