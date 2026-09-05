#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify server and client actions concerning subject names.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509certificatetemplatesubjectnameflag
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509CertificateTemplateSubjectNameFlag extends Win32Enum {

    /**
     * Instructs the client to provide subject information in the certificate request.
     * Native name: SubjectNameEnrolleeSupplies
     * @type {Integer (Int32)}
     */
    static EnrolleeSupplies => 1

    /**
     * Instructs the certification authority (CA) to specify the requestor's Active Directory distinguished name as the subject name in the issued certificate.
     * Native name: SubjectNameRequireDirectoryPath
     * @type {Integer (Int32)}
     */
    static RequireDirectoryPath => -2147483648

    /**
     * Instructs the certification authority (CA) to specify the requestor's Active Directory common name (CN) as the subject name in the issued certificate.
     * Native name: SubjectNameRequireCommonName
     * @type {Integer (Int32)}
     */
    static RequireCommonName => 1073741824

    /**
     * Instructs the CA to specify the value of the <b>e-mail</b> attribute in the requestor's Active Directory user object as the subject name in the issued certificate.
     * Native name: SubjectNameRequireEmail
     * @type {Integer (Int32)}
     */
    static RequireEmail => 536870912

    /**
     * Instructs the CA to specify the value of the <b>DNS</b> attribute in the requestor's Active Directory user object as the subject name in the issued certificate.
     * Native name: SubjectNameRequireDNS
     * @type {Integer (Int32)}
     */
    static RequireDNS => 268435456

    /**
     * Instructs the client to reuse the subject name and alternative subject name extensions from an existing valid certificate when creating a renewal certificate request.  This flag can only be used when the <b>SubjectNameEnrolleeSupplies</b> or the <b>SubjectAlternativeNameEnrolleeSupplies</b> flag is specified.
     * Native name: SubjectNameAndAlternativeNameOldCertSupplies
     * @type {Integer (Int32)}
     */
    static AndAlternativeNameOldCertSupplies => 8

    /**
     * Instructs the client to provide subject alternative name information in the certificate request.
     * Native name: SubjectAlternativeNameEnrolleeSupplies
     * @type {Integer (Int32)}
     */
    static AlternativeNameEnrolleeSupplies => 65536

    /**
     * Instructs the CA to add the value of the <b>objectGUID </b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension in the issued certificate.
     * Native name: SubjectAlternativeNameRequireDirectoryGUID
     * @type {Integer (Int32)}
     */
    static AlternativeNameRequireDirectoryGUID => 16777216

    /**
     * Instructs the CA to add the value of the <b>UPN</b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension in the issued certificate.
     * Native name: SubjectAlternativeNameRequireUPN
     * @type {Integer (Int32)}
     */
    static AlternativeNameRequireUPN => 33554432

    /**
     * Instructs the CA to add the value of the <b>e-mail</b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension in the issued certificate.
     * Native name: SubjectAlternativeNameRequireEmail
     * @type {Integer (Int32)}
     */
    static AlternativeNameRequireEmail => 67108864

    /**
     * Instructs the CA to add the value of the <b>SPN</b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension in the issued certificate.
     * Native name: SubjectAlternativeNameRequireSPN
     * @type {Integer (Int32)}
     */
    static AlternativeNameRequireSPN => 8388608

    /**
     * Instructs the CA to add the value of the <b>DNS</b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension  in the issued certificate.
     * Native name: SubjectAlternativeNameRequireDNS
     * @type {Integer (Int32)}
     */
    static AlternativeNameRequireDNS => 134217728

    /**
     * Instructs the CA to add the value of the DNS of the root domain to the Subject Alternative Name extension  in the issued certificate.
     * Native name: SubjectAlternativeNameRequireDomainDNS
     * @type {Integer (Int32)}
     */
    static AlternativeNameRequireDomainDNS => 4194304
}
