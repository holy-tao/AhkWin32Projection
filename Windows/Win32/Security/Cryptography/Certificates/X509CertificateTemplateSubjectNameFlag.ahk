#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify server and client actions concerning subject names.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509certificatetemplatesubjectnameflag
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509CertificateTemplateSubjectNameFlag extends Win32Enum{

    /**
     * Instructs the client to provide subject information in the certificate request.
     * @type {Integer (Int32)}
     */
    static SubjectNameEnrolleeSupplies => 1

    /**
     * Instructs the certification authority (CA) to specify the requestor's Active Directory distinguished name as the subject name in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectNameRequireDirectoryPath => -2147483648

    /**
     * Instructs the certification authority (CA) to specify the requestor's Active Directory common name (CN) as the subject name in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectNameRequireCommonName => 1073741824

    /**
     * Instructs the CA to specify the value of the <b>e-mail</b> attribute in the requestor's Active Directory user object as the subject name in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectNameRequireEmail => 536870912

    /**
     * Instructs the CA to specify the value of the <b>DNS</b> attribute in the requestor's Active Directory user object as the subject name in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectNameRequireDNS => 268435456

    /**
     * Instructs the client to reuse the subject name and alternative subject name extensions from an existing valid certificate when creating a renewal certificate request.  This flag can only be used when the <b>SubjectNameEnrolleeSupplies</b> or the <b>SubjectAlternativeNameEnrolleeSupplies</b> flag is specified.
     * @type {Integer (Int32)}
     */
    static SubjectNameAndAlternativeNameOldCertSupplies => 8

    /**
     * Instructs the client to provide subject alternative name information in the certificate request.
     * @type {Integer (Int32)}
     */
    static SubjectAlternativeNameEnrolleeSupplies => 65536

    /**
     * Instructs the CA to add the value of the <b>objectGUID </b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectAlternativeNameRequireDirectoryGUID => 16777216

    /**
     * Instructs the CA to add the value of the <b>UPN</b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectAlternativeNameRequireUPN => 33554432

    /**
     * Instructs the CA to add the value of the <b>e-mail</b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectAlternativeNameRequireEmail => 67108864

    /**
     * Instructs the CA to add the value of the <b>SPN</b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectAlternativeNameRequireSPN => 8388608

    /**
     * Instructs the CA to add the value of the <b>DNS</b> attribute in the requestor's Active Directory user object to the Subject Alternative Name extension  in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectAlternativeNameRequireDNS => 134217728

    /**
     * Instructs the CA to add the value of the DNS of the root domain to the Subject Alternative Name extension  in the issued certificate.
     * @type {Integer (Int32)}
     */
    static SubjectAlternativeNameRequireDomainDNS => 4194304
}
