#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify server and client actions during enrollment.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509certificatetemplateenrollmentflag
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509CertificateTemplateEnrollmentFlag extends Win32Enum {

    /**
     * Instructs the client and server to include a Secure/Multipurpose Internet Mail Extensions (S/MIME) extension in the certificate request and issued certificate.
     * Native name: EnrollmentIncludeSymmetricAlgorithms
     * @type {Integer (Int32)}
     */
    static IncludeSymmetricAlgorithms => 1

    /**
     * Instructs the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) to place all certificate requests in a pending state.
     * Native name: EnrollmentPendAllRequests
     * @type {Integer (Int32)}
     */
    static PendAllRequests => 2

    /**
     * Instructs the certification authority to publish the issued certificate to the key recovery agent (KRA) container in Active Directory.
     * Native name: EnrollmentPublishToKRAContainer
     * @type {Integer (Int32)}
     */
    static PublishToKRAContainer => 4

    /**
     * Instructs clients and servers to append the issued certificate to the <b>userCertificate</b> attribute on the user object in Active Directory.
     * Native name: EnrollmentPublishToDS
     * @type {Integer (Int32)}
     */
    static PublishToDS => 8

    /**
     * Instructs clients to not automatically enroll a certificate based on this template if the <b>userCertificate</b> attribute on the user object in Active Directory already contains a valid certificate based on this template.
     * Native name: EnrollmentAutoEnrollmentCheckUserDSCertificate
     * @type {Integer (Int32)}
     */
    static AutoEnrollmentCheckUserDSCertificate => 16

    /**
     * Instructs clients to automatically enroll a certificate that is based on this template.
     * Native name: EnrollmentAutoEnrollment
     * @type {Integer (Int32)}
     */
    static AutoEnrollment => 32

    /**
     * Not used.
     * Native name: EnrollmentDomainAuthenticationNotRequired
     * @type {Integer (Int32)}
     */
    static DomainAuthenticationNotRequired => 128

    /**
     * Instructs clients to sign a certificate by using private keys whose public keys are contained in  existing certificates.
     * Native name: EnrollmentPreviousApprovalValidateReenrollment
     * @type {Integer (Int32)}
     */
    static PreviousApprovalValidateReenrollment => 64

    /**
     * Instructs the client to obtain user consent before attempting to enroll a certificate request based on this template.
     * Native name: EnrollmentUserInteractionRequired
     * @type {Integer (Int32)}
     */
    static UserInteractionRequired => 256

    /**
     * Not used.
     * Native name: EnrollmentAddTemplateName
     * @type {Integer (Int32)}
     */
    static AddTemplateName => 512

    /**
     * Instructs the client to delete expired, revoked, or renewed certificates from the local certificate store.
     * Native name: EnrollmentRemoveInvalidCertificateFromPersonalStore
     * @type {Integer (Int32)}
     */
    static RemoveInvalidCertificateFromPersonalStore => 1024

    /**
     * Instructs the server to allow enroll-on-behalf-of (EOBO) functionality.
     * Native name: EnrollmentAllowEnrollOnBehalfOf
     * @type {Integer (Int32)}
     */
    static AllowEnrollOnBehalfOf => 2048

    /**
     * Instructs the server to not include revocation information in the issued certificate, adding instead an id-pkix-ocsp-nocheck extension that specifies that the certificate holder can be trusted for the life of the certificate.
     * Native name: EnrollmentAddOCSPNoCheck
     * @type {Integer (Int32)}
     */
    static AddOCSPNoCheck => 4096

    /**
     * Instructs the client to reuse a private key for a smart card based certificate renewal if a new private key cannot be created on the card.
     * Native name: EnrollmentReuseKeyOnFullSmartCard
     * @type {Integer (Int32)}
     */
    static ReuseKeyOnFullSmartCard => 8192

    /**
     * Instructs the server to not include revocation information in the issued certificate.
     * Native name: EnrollmentNoRevocationInfoInCerts
     * @type {Integer (Int32)}
     */
    static NoRevocationInfoInCerts => 16384

    /**
     * Instructs the server to include the Basic Constraints extension in the issued certificate.
     * Native name: EnrollmentIncludeBasicConstraintsForEECerts
     * @type {Integer (Int32)}
     */
    static IncludeBasicConstraintsForEECerts => 32768

    /**
     * Native name: EnrollmentPreviousApprovalKeyBasedValidateReenrollment
     * @type {Integer (Int32)}
     */
    static PreviousApprovalKeyBasedValidateReenrollment => 65536

    /**
     * Native name: EnrollmentCertificateIssuancePoliciesFromRequest
     * @type {Integer (Int32)}
     */
    static CertificateIssuancePoliciesFromRequest => 131072

    /**
     * Native name: EnrollmentSkipAutoRenewal
     * @type {Integer (Int32)}
     */
    static SkipAutoRenewal => 262144
}
