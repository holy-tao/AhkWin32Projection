#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of application that created a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-requestclientinfoclientid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class RequestClientInfoClientId{

    /**
     * No client identifier is specified.
     * @type {Integer (Int32)}
     */
    static ClientIdNone => 0

    /**
     * Specifies the Certificate Enrollment Control that is available on Windows Server 2003.
     * @type {Integer (Int32)}
     */
    static ClientIdXEnroll2003 => 1

    /**
     * Specifies the autoenrollment  that is available on Windows Server 2003.
     * @type {Integer (Int32)}
     */
    static ClientIdAutoEnroll2003 => 2

    /**
     * Specifies the Certificate Request Wizard that is available on Windows Server 2003.
     * @type {Integer (Int32)}
     */
    static ClientIdWizard2003 => 3

    /**
     * Specifies the Certreq.exe command-line tool that is available on Windows Server 2003.
     * @type {Integer (Int32)}
     */
    static ClientIdCertReq2003 => 4

    /**
     * Specifies the default certificate request object that is available starting with Windows Vista. This is represented by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequest">IX509CertificateRequest</a> interface and is the default value if the client ID is not set by the caller.
     * @type {Integer (Int32)}
     */
    static ClientIdDefaultRequest => 5

    /**
     * Specifies the autoenrollment that is available starting with  Windows Vista.
     * @type {Integer (Int32)}
     */
    static ClientIdAutoEnroll => 6

    /**
     * Specifies the Certificate Request Wizard that is available starting with Windows Vista.
     * @type {Integer (Int32)}
     */
    static ClientIdRequestWizard => 7

    /**
     * Specifies the Enroll-On-Behalf-Of (EOBO) Wizard that is available starting with Windows Vista.
     * @type {Integer (Int32)}
     */
    static ClientIdEOBO => 8

    /**
     * Specifies the Certreq.exe command-line tool that is available starting with Windows Vista.
     * @type {Integer (Int32)}
     */
    static ClientIdCertReq => 9

    /**
     * This value is not supported.
     * @type {Integer (Int32)}
     */
    static ClientIdTest => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ClientIdWinRT => 11

    /**
     * This is the base value for custom applications.
     * @type {Integer (Int32)}
     */
    static ClientIdUserStart => 1000
}
