#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of application that created a certificate request.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-requestclientinfoclientid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class RequestClientInfoClientId extends Win32Enum {

    /**
     * No client identifier is specified.
     * Native name: ClientIdNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies the Certificate Enrollment Control that is available on Windows Server 2003.
     * Native name: ClientIdXEnroll2003
     * @type {Integer (Int32)}
     */
    static IdXEnroll2003 => 1

    /**
     * Specifies the autoenrollment  that is available on Windows Server 2003.
     * Native name: ClientIdAutoEnroll2003
     * @type {Integer (Int32)}
     */
    static AutoEnroll2003 => 2

    /**
     * Specifies the Certificate Request Wizard that is available on Windows Server 2003.
     * Native name: ClientIdWizard2003
     * @type {Integer (Int32)}
     */
    static Wizard2003 => 3

    /**
     * Specifies the Certreq.exe command-line tool that is available on Windows Server 2003.
     * Native name: ClientIdCertReq2003
     * @type {Integer (Int32)}
     */
    static CertReq2003 => 4

    /**
     * Specifies the default certificate request object that is available starting with Windows Vista. This is represented by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequest">IX509CertificateRequest</a> interface and is the default value if the client ID is not set by the caller.
     * Native name: ClientIdDefaultRequest
     * @type {Integer (Int32)}
     */
    static DefaultRequest => 5

    /**
     * Specifies the autoenrollment that is available starting with  Windows Vista.
     * Native name: ClientIdAutoEnroll
     * @type {Integer (Int32)}
     */
    static AutoEnroll => 6

    /**
     * Specifies the Certificate Request Wizard that is available starting with Windows Vista.
     * Native name: ClientIdRequestWizard
     * @type {Integer (Int32)}
     */
    static RequestWizard => 7

    /**
     * Specifies the Enroll-On-Behalf-Of (EOBO) Wizard that is available starting with Windows Vista.
     * Native name: ClientIdEOBO
     * @type {Integer (Int32)}
     */
    static IdEOBO => 8

    /**
     * Specifies the Certreq.exe command-line tool that is available starting with Windows Vista.
     * Native name: ClientIdCertReq
     * @type {Integer (Int32)}
     */
    static CertReq => 9

    /**
     * This value is not supported.
     * Native name: ClientIdTest
     * @type {Integer (Int32)}
     */
    static Test => 10

    /**
     * Native name: ClientIdWinRT
     * @type {Integer (Int32)}
     */
    static WinRT => 11

    /**
     * This is the base value for custom applications.
     * Native name: ClientIdUserStart
     * @type {Integer (Int32)}
     */
    static UserStart => 1000
}
