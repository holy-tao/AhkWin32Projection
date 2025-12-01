#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies how keys, extension values, and external properties are inherited when a new request is created from an existing certificate.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509requestinheritoptions
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509RequestInheritOptions extends Win32Enum{

    /**
     * Inheritance is not specified. For more information, see the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface.
     * @type {Integer (Int32)}
     */
    static InheritDefault => 0

    /**
     * Creates a new key but inherits the default <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) or KSP.
     * @type {Integer (Int32)}
     */
    static InheritNewDefaultKey => 1

    /**
     * Creates a new key but inherits the CSP or KSP used to create the existing certificate.
     * @type {Integer (Int32)}
     */
    static InheritNewSimilarKey => 2

    /**
     * Inherits the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private</a> and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public keys</a>.
     * @type {Integer (Int32)}
     */
    static InheritPrivateKey => 3

    /**
     * Inherits only the public key.
     * @type {Integer (Int32)}
     */
    static InheritPublicKey => 4

    /**
     * Use to mask the lower-order 4 bits that identify key inheritance.
     * @type {Integer (Int32)}
     */
    static InheritKeyMask => 15

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
     * @type {Integer (Int32)}
     */
    static InheritNone => 16

    /**
     * Inherits the renewal certificate. Specifying this flag sets an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyrenewal">ICertPropertyRenewal</a> value.
     * @type {Integer (Int32)}
     */
    static InheritRenewalCertificateFlag => 32

    /**
     * Inherits the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate template</a>.
     * @type {Integer (Int32)}
     */
    static InheritTemplateFlag => 64

    /**
     * Inherits the subject distinguished name.
     * @type {Integer (Int32)}
     */
    static InheritSubjectFlag => 128

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
     * @type {Integer (Int32)}
     */
    static InheritExtensionsFlag => 256

    /**
     * Inherits the <b>SubjectAlternativeName</b> extension.
     * @type {Integer (Int32)}
     */
    static InheritSubjectAltNameFlag => 512

    /**
     * Inherits the validity period.
     * @type {Integer (Int32)}
     */
    static InheritValidityPeriodFlag => 1024

    /**
     * 
     * @type {Integer (Int32)}
     */
    static InheritReserved80000000 => -2147483648
}
