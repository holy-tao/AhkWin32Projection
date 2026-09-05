#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains property values for a given template.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmenttemplateproperty
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class EnrollmentTemplateProperty extends Win32Enum {

    /**
     * A <b>VT_BSTR</b> value that contains the common name of the template in Active Directory.
     * Native name: TemplatePropCommonName
     * @type {Integer (Int32)}
     */
    static PropCommonName => 1

    /**
     * A <b>VT_BSTR</b> value that contains the template display name.
     * Native name: TemplatePropFriendlyName
     * @type {Integer (Int32)}
     */
    static PropFriendlyName => 2

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of extended key usage object identifiers. This value applies to version 2 and later templates.
     * Native name: TemplatePropEKUs
     * @type {Integer (Int32)}
     */
    static PropEKUs => 3

    /**
     * A <b>VT_ARRAY|VT_BSTR</b> collection of cryptographic service providers (version 2) and key storage providers (version 3) that the client can use when generating requests based on  this template.
     * Native name: TemplatePropCryptoProviders
     * @type {Integer (Int32)}
     */
    static PropCryptoProviders => 4

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the major version number for the template.
     * Native name: TemplatePropMajorRevision
     * @type {Integer (Int32)}
     */
    static PropMajorRevision => 5

    /**
     * Not used.
     * Native name: TemplatePropDescription
     * @type {Integer (Int32)}
     */
    static PropDescription => 6

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that contains <b>AT_SIGNATURE</b> or <b>AT_KEYEXCHANGE</b> to specify the <b>Key_Spec</b> value for legacy cryptographic service providers.
     * Native name: TemplatePropKeySpec
     * @type {Integer (Int32)}
     */
    static PropKeySpec => 7

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the template version. Currently, this can be 1, 2, or 3.
     * Native name: TemplatePropSchemaVersion
     * @type {Integer (Int32)}
     */
    static PropSchemaVersion => 8

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the minor version number of a version 2 and later template.
     * Native name: TemplatePropMinorRevision
     * @type {Integer (Int32)}
     */
    static PropMinorRevision => 9

    /**
     * A <b>VT_UI4</b>  (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the number of recovery agent signatures that are required when generating a certificate request base on this template.
     * Native name: TemplatePropRASignatureCount
     * @type {Integer (Int32)}
     */
    static PropRASignatureCount => 10

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the minimum size of the public key used by the enrolling client.
     * Native name: TemplatePropMinimumKeySize
     * @type {Integer (Int32)}
     */
    static PropMinimumKeySize => 11

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that contains an object identifier for this template. This value applies to version 2 and later templates.
     * Native name: TemplatePropOID
     * @type {Integer (Int32)}
     */
    static PropOID => 12

    /**
     * A <b>VT_ARRAY|VT_BSTR</b> collection that contains the common names of all version 2 and later templates that have been superseded.
     * Native name: TemplatePropSupersede
     * @type {Integer (Int32)}
     */
    static PropSupersede => 13

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of certificate policy object identifiers for the registration authority certificates. This value applies to version 2 and later templates.
     * Native name: TemplatePropRACertificatePolicies
     * @type {Integer (Int32)}
     */
    static PropRACertificatePolicies => 14

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of application policy object identifiers for the registration authority certificates. This value applies to version 2 and later templates.
     * Native name: TemplatePropRAEKUs
     * @type {Integer (Int32)}
     */
    static PropRAEKUs => 15

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of policy object identifiers to be added to the certificate policy extension.
     * Native name: TemplatePropCertificatePolicies
     * @type {Integer (Int32)}
     */
    static PropCertificatePolicies => 16

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that contains a collection of policy object identifiers to be added to the certificate application policy extension.
     * Native name: TemplatePropV1ApplicationPolicy
     * @type {Integer (Int32)}
     */
    static PropV1ApplicationPolicy => 17

    /**
     * A <b>VT_BSTR</b> value that specifies the name of a public key algorithm the enrolling client must use when generating a certificate request based on  this template. This value applies to version 3 and later templates.
     * Native name: TemplatePropAsymmetricAlgorithm
     * @type {Integer (Int32)}
     */
    static PropAsymmetricAlgorithm => 18

    /**
     * A <b>VT_BSTR</b> value that specifies the asymmetric key security descriptor for version 3 and later templates.
     * Native name: TemplatePropKeySecurityDescriptor
     * @type {Integer (Int32)}
     */
    static PropKeySecurityDescriptor => 19

    /**
     * A <b>VT_BSTR</b> value that specifies the name of the symmetric algorithm that a client must use for key exchange when using this template. This value applies to version 3 and later templates.
     * Native name: TemplatePropSymmetricAlgorithm
     * @type {Integer (Int32)}
     */
    static PropSymmetricAlgorithm => 20

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that specifies the length, in bits, of the symmetric key. This value applies to version 3 and later templates.
     * Native name: TemplatePropSymmetricKeyLength
     * @type {Integer (Int32)}
     */
    static PropSymmetricKeyLength => 21

    /**
     * A <b>VT_BSTR</b> value that specifies the name of the hashing algorithm that an enrolling client must use. This value applies to version 3 and later templates.
     * Native name: TemplatePropHashAlgorithm
     * @type {Integer (Int32)}
     */
    static PropHashAlgorithm => 22

    /**
     * Native name: TemplatePropKeyUsage
     * @type {Integer (Int32)}
     */
    static PropKeyUsage => 23

    /**
     * A <b>VT_I4</b> value that contains a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificatetemplateenrollmentflag">X509CertificateTemplateEnrollmentFlag</a> values.
     * Native name: TemplatePropEnrollmentFlags
     * @type {Integer (Int32)}
     */
    static PropEnrollmentFlags => 24

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that contains a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificatetemplatesubjectnameflag">X509CertificateTemplateSubjectNameFlag</a> values.
     * Native name: TemplatePropSubjectNameFlags
     * @type {Integer (Int32)}
     */
    static PropSubjectNameFlags => 25

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that contains a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificatetemplateprivatekeyflag">X509CertificateTemplatePrivateKeyFlag</a> values.
     * Native name: TemplatePropPrivateKeyFlags
     * @type {Integer (Int32)}
     */
    static PropPrivateKeyFlags => 26

    /**
     * A <b>VT_UI4</b> (<b>VT_I4</b> beginning with Windows 8.1) value that contains a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificatetemplategeneralflag">X509CertificateTemplateGeneralFlag</a> values.
     * Native name: TemplatePropGeneralFlags
     * @type {Integer (Int32)}
     */
    static PropGeneralFlags => 27

    /**
     * A <b>VT_BSTR</b> value that specifies the security descriptor.
     * Native name: TemplatePropSecurityDescriptor
     * @type {Integer (Int32)}
     */
    static PropSecurityDescriptor => 28

    /**
     * A <b>VT_DISPATCH</b> pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> interface that contains the certificate extensions to be added to the certificate request when generating requests based on this template.
     * Native name: TemplatePropExtensions
     * @type {Integer (Int32)}
     */
    static PropExtensions => 29

    /**
     * A <b>VT_UI8 FILETIME</b> value that contains the maximum validity period, in seconds, of the certificate.
     * Native name: TemplatePropValidityPeriod
     * @type {Integer (Int32)}
     */
    static PropValidityPeriod => 30

    /**
     * A <b>VT_UI8 FILETIME</b> value that specifies the amount of time before expiration that automatic enrollment has to  attempt certificate renewal.
     * Native name: TemplatePropRenewalPeriod
     * @type {Integer (Int32)}
     */
    static PropRenewalPeriod => 31
}
