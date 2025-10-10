#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains use and modification information about templates and associated certificates.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-x509certificatetemplategeneralflag
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509CertificateTemplateGeneralFlag{

    /**
     * The template should be used to create a certificate request for a computer.
     * @type {Integer (Int32)}
     */
    static GeneralMachineType => 64

    /**
     * The template should be used to create a request for a certification authority certificate.
     * @type {Integer (Int32)}
     */
    static GeneralCA => 128

    /**
     * The template should be used to create a request to cross certify a certificate.
     * @type {Integer (Int32)}
     */
    static GeneralCrossCA => 2048

    /**
     * The template is not used by the client or server in the Windows Client Certificate Enrollment and should not be modified.
     * @type {Integer (Int32)}
     */
    static GeneralDefault => 65536

    /**
     * The template is not used by the client or server in the Windows Client Certificate Enrollment and can be modified if necessary.
     * @type {Integer (Int32)}
     */
    static GeneralModified => 131072

    /**
     * The certification authority is not required to save a record of a certificate request for a certificate that has been issued.
     * @type {Integer (Int32)}
     */
    static GeneralDonotPersist => 4096
}
