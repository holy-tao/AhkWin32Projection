#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a domain authentication method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_domain_authentication_kind
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_DOMAIN_AUTHENTICATION_KIND extends Win32Enum{

    /**
     * Specifies no domain authentication method; and/or that the network couldn't be domain-authenticated.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_AUTHENTICATION_KIND_NONE => 0

    /**
     * Specifies the domain authentication method for an Active Directory network; and/or that the machine was successful in a Lightweight Directory Access Protocol (LDAP) authentication request against the configured Active Directory servers on the current network.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_AUTHENTICATION_KIND_LDAP => 1

    /**
     * Specifies the Transport Layer Security (TLS) domain authentication method; and/or that the network connection was able to successfully complete a HTTPS connection with verified TLS authentication to an endpoint configured by the `AllowedTlsAuthenticationEndpoints` Mobile Device Management (MDM) policy.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_AUTHENTICATION_KIND_TLS => 2
}
