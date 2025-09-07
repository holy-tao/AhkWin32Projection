#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains property values for a given template.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmenttemplateproperty
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class EnrollmentTemplateProperty{

    /**
     * A <b>VT_BSTR</b> value that contains the common name of the template in Active Directory.
     * @type {Integer (Int32)}
     */
    static TemplatePropCommonName => 1

    /**
     * A <b>VT_BSTR</b> value that contains the template display name.
     * @type {Integer (Int32)}
     */
    static TemplatePropFriendlyName => 2

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of extended key usage object identifiers. This value applies to version 2 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropEKUs => 3

    /**
     * A <b>VT_ARRAY|VT_BSTR</b> collection of cryptographic service providers (version 2) and key storage providers (version 3) that the client can use when generating requests based on  this template.
     * @type {Integer (Int32)}
     */
    static TemplatePropCryptoProviders => 4

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the major version number for the template.
     * @type {Integer (Int32)}
     */
    static TemplatePropMajorRevision => 5

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static TemplatePropDescription => 6

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that contains <b>AT_SIGNATURE</b> or <b>AT_KEYEXCHANGE</b> to specify the <b>Key_Spec</b> value for legacy cryptographic service providers.
     * @type {Integer (Int32)}
     */
    static TemplatePropKeySpec => 7

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the template version. Currently, this can be 1, 2, or 3.
     * @type {Integer (Int32)}
     */
    static TemplatePropSchemaVersion => 8

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the minor version number of a version 2 and later template.
     * @type {Integer (Int32)}
     */
    static TemplatePropMinorRevision => 9

    /**
     * A <b>VT_UI4</b>  (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the number of recovery agent signatures that are required when generating a certificate request base on this template.
     * @type {Integer (Int32)}
     */
    static TemplatePropRASignatureCount => 10

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the minimum size of the public key used by the enrolling client.
     * @type {Integer (Int32)}
     */
    static TemplatePropMinimumKeySize => 11

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that contains an object identifier for this template. This value applies to version 2 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropOID => 12

    /**
     * A <b>VT_ARRAY|VT_BSTR</b> collection that contains the common names of all version 2 and later templates that have been superseded.
     * @type {Integer (Int32)}
     */
    static TemplatePropSupersede => 13

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of certificate policy object identifiers for the registration authority certificates. This value applies to version 2 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropRACertificatePolicies => 14

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of application policy object identifiers for the registration authority certificates. This value applies to version 2 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropRAEKUs => 15

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of policy object identifiers to be added to the certificate policy extension.
     * @type {Integer (Int32)}
     */
    static TemplatePropCertificatePolicies => 16

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of policy object identifiers to be added to the certificate application policy extension.
     * @type {Integer (Int32)}
     */
    static TemplatePropV1ApplicationPolicy => 17

    /**
     * A <b>VT_BSTR</b> value that specifies the name of a public key algorithm the enrolling client must use when generating a certificate request based on  this template. This value applies to version 3 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropAsymmetricAlgorithm => 18

    /**
     * A <b>VT_BSTR</b> value that specifies the asymmetric key security descriptor for version 3 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropKeySecurityDescriptor => 19

    /**
     * A <b>VT_BSTR</b> value that specifies the name of the symmetric algorithm that a client must use for key exchange when using this template. This value applies to version 3 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropSymmetricAlgorithm => 20

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the length, in bits, of the symmetric key. This value applies to version 3 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropSymmetricKeyLength => 21

    /**
     * A <b>VT_BSTR</b> value that specifies the name of the hashing algorithm that an enrolling client must use. This value applies to version 3 and later templates.
     * @type {Integer (Int32)}
     */
    static TemplatePropHashAlgorithm => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TemplatePropKeyUsage => 23

    /**
     * A <b>VT_I4</b> value that contains a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificatetemplateenrollmentflag">X509CertificateTemplateEnrollmentFlag</a> values.
     * @type {Integer (Int32)}
     */
    static TemplatePropEnrollmentFlags => 24

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that contains a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificatetemplatesubjectnameflag">X509CertificateTemplateSubjectNameFlag</a> values.
     * @type {Integer (Int32)}
     */
    static TemplatePropSubjectNameFlags => 25

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that contains a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificatetemplateprivatekeyflag">X509CertificateTemplatePrivateKeyFlag</a> values.
     * @type {Integer (Int32)}
     */
    static TemplatePropPrivateKeyFlags => 26

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that contains a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificatetemplategeneralflag">X509CertificateTemplateGeneralFlag</a> values.
     * @type {Integer (Int32)}
     */
    static TemplatePropGeneralFlags => 27

    /**
     * A <b>VT_BSTR</b> value that specifies the security descriptor.
     * @type {Integer (Int32)}
     */
    static TemplatePropSecurityDescriptor => 28

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> interface that contains the certificate extensions to be added to the certificate request when generating requests based on this template.
     * @type {Integer (Int32)}
     */
    static TemplatePropExtensions => 29

    /**
     * A <b>VT_UI8 FILETIME</b> value that contains the maximum validity period, in seconds, of the certificate.
     * @type {Integer (Int32)}
     */
    static TemplatePropValidityPeriod => 30

    /**
     * A <b>VT_UI8 FILETIME</b> value that specifies the amount of time before expiration that automatic enrollment has to  attempt certificate renewal.
     * @type {Integer (Int32)}
     */
    static TemplatePropRenewalPeriod => 31
}
