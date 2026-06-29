#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the type of logon message passed in a PKU2U_CERTIFICATE_S4U_LOGON structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-pku2u_logon_submit_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKU2U_LOGON_SUBMIT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The logon message is a PKU2U certificate.
     * @type {Integer (Int32)}
     */
    static Pku2uCertificateS4ULogon => 14
}
