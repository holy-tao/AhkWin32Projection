#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the nature of the end entity for which the certificate is intended.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509certificateenrollmentcontext
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct X509CertificateEnrollmentContext {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static ContextNone => 0

    /**
     * The certificate is intended for an end user.
     * @type {Integer (Int32)}
     */
    static ContextUser => 1

    /**
     * The certificate is intended for a computer.
     * @type {Integer (Int32)}
     */
    static ContextMachine => 2

    /**
     * The certificate is being requested by an administrator acting on the behalf of a computer.
     * @type {Integer (Int32)}
     */
    static ContextAdministratorForceMachine => 3
}
