#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the enrollment status of a certificate request.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentenrollstatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct EnrollmentEnrollStatus {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The enrollment succeeded, and the certificate has been issued.
     * @type {Integer (Int32)}
     */
    static Enrolled => 1

    /**
     * The request has been submitted and the enrollment is pending, or the request has been issued out of band.
     * @type {Integer (Int32)}
     */
    static EnrollPended => 2

    /**
     * Enrollment must be deferred.
     * @type {Integer (Int32)}
     */
    static EnrollUIDeferredEnrollmentRequired => 4

    /**
     * An error occurred.
     * @type {Integer (Int32)}
     */
    static EnrollError => 16

    /**
     * The enrollment status is unknown.
     * @type {Integer (Int32)}
     */
    static EnrollUnknown => 32

    /**
     * The status information has been skipped. This can occur if a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> is not valid or has not been selected for monitoring.
     * @type {Integer (Int32)}
     */
    static EnrollSkipped => 64

    /**
     * Enrollment has been denied.
     * @type {Integer (Int32)}
     */
    static EnrollDenied => 256
}
