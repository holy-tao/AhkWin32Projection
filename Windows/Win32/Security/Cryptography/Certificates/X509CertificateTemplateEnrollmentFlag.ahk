#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify server and client actions during enrollment.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-x509certificatetemplateenrollmentflag
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509CertificateTemplateEnrollmentFlag extends Win32Enum{

    /**
     * Instructs the client and server to include a Secure/Multipurpose Internet Mail Extensions (S/MIME) extension in the certificate request and issued certificate.
     * @type {Integer (Int32)}
     */
    static EnrollmentIncludeSymmetricAlgorithms => 1

    /**
     * Instructs the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) to place all certificate requests in a pending state.
     * @type {Integer (Int32)}
     */
    static EnrollmentPendAllRequests => 2

    /**
     * Instructs the certification authority to publish the issued certificate to the key recovery agent (KRA) container in Active Directory.
     * @type {Integer (Int32)}
     */
    static EnrollmentPublishToKRAContainer => 4

    /**
     * Instructs clients and servers to append the issued certificate to the <b>userCertificate</b> attribute on the user object in Active Directory.
     * @type {Integer (Int32)}
     */
    static EnrollmentPublishToDS => 8

    /**
     * Instructs clients to not automatically enroll a certificate based on this template if the <b>userCertificate</b> attribute on the user object in Active Directory already contains a valid certificate based on this template.
     * @type {Integer (Int32)}
     */
    static EnrollmentAutoEnrollmentCheckUserDSCertificate => 16

    /**
     * Instructs clients to automatically enroll a certificate that is based on this template.
     * @type {Integer (Int32)}
     */
    static EnrollmentAutoEnrollment => 32

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static EnrollmentDomainAuthenticationNotRequired => 128

    /**
     * Instructs clients to sign a certificate by using private keys whose public keys are contained in  existing certificates.
     * @type {Integer (Int32)}
     */
    static EnrollmentPreviousApprovalValidateReenrollment => 64

    /**
     * Instructs the client to obtain user consent before attempting to enroll a certificate request based on this template.
     * @type {Integer (Int32)}
     */
    static EnrollmentUserInteractionRequired => 256

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static EnrollmentAddTemplateName => 512

    /**
     * Instructs the client to delete expired, revoked, or renewed certificates from the local certificate store.
     * @type {Integer (Int32)}
     */
    static EnrollmentRemoveInvalidCertificateFromPersonalStore => 1024

    /**
     * Instructs the server to allow enroll-on-behalf-of (EOBO) functionality.
     * @type {Integer (Int32)}
     */
    static EnrollmentAllowEnrollOnBehalfOf => 2048

    /**
     * Instructs the server to not include revocation information in the issued certificate, adding instead an id-pkix-ocsp-nocheck extension that specifies that the certificate holder can be trusted for the life of the certificate.
     * @type {Integer (Int32)}
     */
    static EnrollmentAddOCSPNoCheck => 4096

    /**
     * Instructs the client to reuse a private key for a smart card based certificate renewal if a new private key cannot be created on the card.
     * @type {Integer (Int32)}
     */
    static EnrollmentReuseKeyOnFullSmartCard => 8192

    /**
     * Instructs the server to not include revocation information in the issued certificate.
     * @type {Integer (Int32)}
     */
    static EnrollmentNoRevocationInfoInCerts => 16384

    /**
     * Instructs the server to include the Basic Constraints extension in the issued certificate.
     * @type {Integer (Int32)}
     */
    static EnrollmentIncludeBasicConstraintsForEECerts => 32768

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EnrollmentPreviousApprovalKeyBasedValidateReenrollment => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EnrollmentCertificateIssuancePoliciesFromRequest => 131072

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EnrollmentSkipAutoRenewal => 262144
}
