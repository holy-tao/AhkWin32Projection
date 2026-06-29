#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the type of policy domain information.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-policy_domain_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_DOMAIN_INFORMATION_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
