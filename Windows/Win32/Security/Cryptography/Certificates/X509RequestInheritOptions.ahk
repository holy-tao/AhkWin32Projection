#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies how keys, extension values, and external properties are inherited when a new request is created from an existing certificate.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509requestinheritoptions
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509RequestInheritOptions extends Win32Enum {

    /**
     * Inheritance is not specified. For more information, see the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface.
     * Native name: InheritDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Creates a new key but inherits the default <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) or KSP.
     * Native name: InheritNewDefaultKey
     * @type {Integer (Int32)}
     */
    static NewDefaultKey => 1

    /**
     * Creates a new key but inherits the CSP or KSP used to create the existing certificate.
     * Native name: InheritNewSimilarKey
     * @type {Integer (Int32)}
     */
    static NewSimilarKey => 2

    /**
     * Inherits the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private</a> and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public keys</a>.
     * Native name: InheritPrivateKey
     * @type {Integer (Int32)}
     */
    static PrivateKey => 3

    /**
     * Inherits only the public key.
     * Native name: InheritPublicKey
     * @type {Integer (Int32)}
     */
    static PublicKey => 4

    /**
     * Use to mask the lower-order 4 bits that identify key inheritance.
     * Native name: InheritKeyMask
     * @type {Integer (Int32)}
     */
    static KeyMask => 15

    /**
     * Prevents use of the following inheritance values:
     * 
     * <ul>
     * <li><b>InheritRenewalCertificateFlag</b></li>
     * <li><b>InheritTemplateFlag</b></li>
     * <li><b>InheritSubjectFlag</b></li>
     * <li><b>InheritExtensionsFlag</b></li>
     * <li><b>InheritSubjectAltNameFlag</b></li>
     * <li><b>InheritValidityPeriodFlag</b></li>
     * </ul>
     * Native name: InheritNone
     * @type {Integer (Int32)}
     */
    static None => 16

    /**
     * Inherits the renewal certificate. Specifying this flag sets an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyrenewal">ICertPropertyRenewal</a> value.
     * Native name: InheritRenewalCertificateFlag
     * @type {Integer (Int32)}
     */
    static RenewalCertificateFlag => 32

    /**
     * Inherits the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate template</a>.
     * Native name: InheritTemplateFlag
     * @type {Integer (Int32)}
     */
    static TemplateFlag => 64

    /**
     * Inherits the subject distinguished name.
     * Native name: InheritSubjectFlag
     * @type {Integer (Int32)}
     */
    static SubjectFlag => 128

    /**
     * Inherits the relevant extensions from the certificate. Extension values associated with the following <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifiers</a> are not inherited:
     * 
     * <ul>
     * <li>XCN_OID_CERTSRV_CA_VERSION</li>
     * <li>XCN_OID_AUTHORITY_INFO_ACCESS</li>
     * <li>XCN_OID_CRL_DIST_POINTS</li>
     * <li>XCN_OID_AUTHORITY_KEY_IDENTIFIER2</li>
     * <li>XCN_OID_CERTSRV_PREVIOUS_CERT_HASH</li>
     * <li>XCN_OID_ENROLL_CERTTYPE_EXTENSION</li>
     * <li>XCN_OID_CERTIFICATE_TEMPLATE</li>
     * </ul>
     * Native name: InheritExtensionsFlag
     * @type {Integer (Int32)}
     */
    static ExtensionsFlag => 256

    /**
     * Inherits the <b>SubjectAlternativeName</b> extension.
     * Native name: InheritSubjectAltNameFlag
     * @type {Integer (Int32)}
     */
    static SubjectAltNameFlag => 512

    /**
     * Inherits the validity period.
     * Native name: InheritValidityPeriodFlag
     * @type {Integer (Int32)}
     */
    static ValidityPeriodFlag => 1024

    /**
     * Native name: InheritReserved80000000
     * @type {Integer (Int32)}
     */
    static Reserved80000000 => -2147483648
}
