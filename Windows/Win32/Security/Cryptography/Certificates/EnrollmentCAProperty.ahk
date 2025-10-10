#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies certification authority property values.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-enrollmentcaproperty
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class EnrollmentCAProperty{

    /**
     * A <b>VT_BSTR</b> value that contains the common name of the certification authority (CA) in Active Directory.
     * @type {Integer (Int32)}
     */
    static CAPropCommonName => 1

    /**
     * A <b>VT_DISPATCH</b> value that contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix500distinguishedname">IX500DistinguishedName</a> object.
     * @type {Integer (Int32)}
     */
    static CAPropDistinguishedName => 2

    /**
     * A <b>VT_BSTR</b> value that contains the sanitized common  name of the CA in Active Directory. A name is sanitized by replacing disallowed characters with an exclamation point (!) followed by four hexadecimal values that represent the character.
     * @type {Integer (Int32)}
     */
    static CAPropSanitizedName => 3

    /**
     * A <b>VT_BSTR</b> value that contains the sanitized and shortened common  name of the CA in Active Directory. A name is sanitized by replacing disallowed characters with an exclamation point (!) followed by four hexadecimal values that represent the character. The name is then shortened so that it does not exceed 51 characters. The characters that are removed from the sanitized string must be hashed and the hash converted to a 5-character string.
     * @type {Integer (Int32)}
     */
    static CAPropSanitizedShortName => 4

    /**
     * A <b>VT_BSTR</b> value that contains the DNS  name of the CA in Active Directory.
     * @type {Integer (Int32)}
     */
    static CAPropDNSName => 5

    /**
     * A <b>VT_ARRAY|VT_BSTR</b> collection of templates supported by the CA.
     * @type {Integer (Int32)}
     */
    static CAPropCertificateTypes => 6

    /**
     * A <b>VT_ARRAY | VT_UI1</b> value that contains the signing certificate used by the CA.
     * @type {Integer (Int32)}
     */
    static CAPropCertificate => 7

    /**
     * A <b>VT_BSTR</b> value that contains a description comment for the CA.
     * @type {Integer (Int32)}
     */
    static CAPropDescription => 8

    /**
     * A <b>VT_ARRAY|VT_BSTR</b> collection of certificate enrollment servers configured for the CA. Each string in the collection contains a server URL, the authentication method used, an integer that specifies the priority level, and an integer that specifies whether the server can perform only certificate renewals. Each value is delimited by a newline character.
     * @type {Integer (Int32)}
     */
    static CAPropWebServers => 9

    /**
     * A <b>VT_BSTR</b> value that contains the name of the AD site to which the CA belongs. This can be used by the enrolling clients to determine the relative cost of communicating with the CA versus CAs that belong to other sites. This value is relevant only for CA objects retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas">GetCAs</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> interface.
     * @type {Integer (Int32)}
     */
    static CAPropSiteName => 10

    /**
     * A <b>VT_BSTR</b> value that contains the security descriptor definition language (SDDL) string representation of the security descriptor for the CA. This value is relevant only for CA objects retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas">GetCAs</a> method.
     * @type {Integer (Int32)}
     */
    static CAPropSecurity => 11

    /**
     * A <b>VT_BOOL</b> value that specifies whether a CA is configured to perform only certificate renewals. This value is relevant only for CA objects retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas">GetCAs</a> method.
     * @type {Integer (Int32)}
     */
    static CAPropRenewalOnly => 12
}
