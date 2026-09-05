#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains use and modification information about templates and associated certificates.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509certificatetemplategeneralflag
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509CertificateTemplateGeneralFlag extends Win32Enum {

    /**
     * The template should be used to create a certificate request for a computer.
     * Native name: GeneralMachineType
     * @type {Integer (Int32)}
     */
    static MachineType => 64

    /**
     * The template should be used to create a request for a certification authority certificate.
     * @type {Integer (Int32)}
     */
    static GeneralCA => 128

    /**
     * The template should be used to create a request to cross certify a certificate.
     * Native name: GeneralCrossCA
     * @type {Integer (Int32)}
     */
    static CrossCA => 2048

    /**
     * The template is not used by the client or server in the Windows Client Certificate Enrollment and should not be modified.
     * Native name: GeneralDefault
     * @type {Integer (Int32)}
     */
    static Default => 65536

    /**
     * The template is not used by the client or server in the Windows Client Certificate Enrollment and can be modified if necessary.
     * Native name: GeneralModified
     * @type {Integer (Int32)}
     */
    static Modified => 131072

    /**
     * The certification authority is not required to save a record of a certificate request for a certificate that has been issued.
     * Native name: GeneralDonotPersist
     * @type {Integer (Int32)}
     */
    static DonotPersist => 4096
}
