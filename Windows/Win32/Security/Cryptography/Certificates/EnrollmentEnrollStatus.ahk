#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the enrollment status of a certificate request.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentenrollstatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class EnrollmentEnrollStatus extends Win32Enum {

    /**
     * The enrollment succeeded, and the certificate has been issued.
     * @type {Integer (Int32)}
     */
    static Enrolled => 1

    /**
     * The request has been submitted and the enrollment is pending, or the request has been issued out of band.
     * Native name: EnrollPended
     * @type {Integer (Int32)}
     */
    static Pended => 2

    /**
     * Enrollment must be deferred.
     * @type {Integer (Int32)}
     */
    static EnrollUIDeferredEnrollmentRequired => 4

    /**
     * An error occurred.
     * Native name: EnrollError
     * @type {Integer (Int32)}
     */
    static Error => 16

    /**
     * The enrollment status is unknown.
     * Native name: EnrollUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 32

    /**
     * The status information has been skipped. This can occur if a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> is not valid or has not been selected for monitoring.
     * Native name: EnrollSkipped
     * @type {Integer (Int32)}
     */
    static Skipped => 64

    /**
     * Enrollment has been denied.
     * Native name: EnrollDenied
     * @type {Integer (Int32)}
     */
    static Denied => 256
}
