#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the enterprise domain authentication mechanism (if any) associated with a network connection profile. Only one non-`None` value is reported at a time (precedence applies).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.domainauthenticationkind
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class DomainAuthenticationKind extends Win32Enum{

    /**
     * Specifies no domain authentication method; and/or that the network couldn't be domain-authenticated.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies the domain authentication method for an Active Directory network; and/or that the machine was successful in a Lightweight Directory Access Protocol (LDAP) authentication request against the configured Active Directory servers on the current network.
     * @type {Integer (Int32)}
     */
    static Ldap => 1

    /**
     * Specifies the Transport Layer Security (TLS) domain authentication method; and/or that the network connection was able to successfully complete a HTTPS connection with verified TLS authentication to an endpoint configured by the `AllowedTlsAuthenticationEndpoints` Mobile Device Management (MDM) policy.
     * @type {Integer (Int32)}
     */
    static Tls => 2
}
