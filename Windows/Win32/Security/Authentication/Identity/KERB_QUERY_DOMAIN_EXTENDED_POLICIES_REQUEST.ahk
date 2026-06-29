#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * Contains information used to query the domain for the extended policies.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_query_domain_extended_policies_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_QUERY_DOMAIN_EXTENDED_POLICIES_REQUEST {
    #StructPack 8

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbQueryDomainExtendedPoliciesMessage</b>.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * Reserved.
     */
    Flags : UInt32

    /**
     * The 	name of the domain that you are querying for the extended policies.
     */
    DomainName : LSA_UNICODE_STRING

}
