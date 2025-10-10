#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of policy domain information.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ne-ntsecapi-policy_domain_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_DOMAIN_INFORMATION_CLASS{

    /**
     * The information is for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">Encrypting File System</a>.
     * @type {Integer (Int32)}
     */
    static PolicyDomainEfsInformation => 2

    /**
     * The information is for a Kerberos ticket.
     * @type {Integer (Int32)}
     */
    static PolicyDomainKerberosTicketInformation => 3
}
