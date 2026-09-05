#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies certification authority property values.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentcaproperty
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class EnrollmentCAProperty extends Win32Enum {

    /**
     * A <b>VT_BSTR</b> value that contains the common name of the certification authority (CA) in Active Directory.
     * Native name: CAPropCommonName
     * @type {Integer (Int32)}
     */
    static PropCommonName => 1

    /**
     * A <b>VT_DISPATCH</b> value that contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix500distinguishedname">IX500DistinguishedName</a> object.
     * Native name: CAPropDistinguishedName
     * @type {Integer (Int32)}
     */
    static PropDistinguishedName => 2

    /**
     * A <b>VT_BSTR</b> value that contains the sanitized common  name of the CA in Active Directory. A name is sanitized by replacing disallowed characters with an exclamation point (!) followed by four hexadecimal values that represent the character.
     * Native name: CAPropSanitizedName
     * @type {Integer (Int32)}
     */
    static PropSanitizedName => 3

    /**
     * A <b>VT_BSTR</b> value that contains the sanitized and shortened common  name of the CA in Active Directory. A name is sanitized by replacing disallowed characters with an exclamation point (!) followed by four hexadecimal values that represent the character. The name is then shortened so that it does not exceed 51 characters. The characters that are removed from the sanitized string must be hashed and the hash converted to a 5-character string.
     * Native name: CAPropSanitizedShortName
     * @type {Integer (Int32)}
     */
    static PropSanitizedShortName => 4

    /**
     * A <b>VT_BSTR</b> value that contains the DNS  name of the CA in Active Directory.
     * Native name: CAPropDNSName
     * @type {Integer (Int32)}
     */
    static PropDNSName => 5

    /**
     * A <b>VT_ARRAY|VT_BSTR</b> collection of templates supported by the CA.
     * Native name: CAPropCertificateTypes
     * @type {Integer (Int32)}
     */
    static PropCertificateTypes => 6

    /**
     * A <b>VT_ARRAY | VT_UI1</b> value that contains the signing certificate used by the CA.
     * Native name: CAPropCertificate
     * @type {Integer (Int32)}
     */
    static PropCertificate => 7

    /**
     * A <b>VT_BSTR</b> value that contains a description comment for the CA.
     * Native name: CAPropDescription
     * @type {Integer (Int32)}
     */
    static PropDescription => 8

    /**
     * A <b>VT_ARRAY|VT_BSTR</b> collection of certificate enrollment servers configured for the CA. Each string in the collection contains a server URL, the authentication method used, an integer that specifies the priority level, and an integer that specifies whether the server can perform only certificate renewals. Each value is delimited by a newline character.
     * Native name: CAPropWebServers
     * @type {Integer (Int32)}
     */
    static PropWebServers => 9

    /**
     * A <b>VT_BSTR</b> value that contains the name of the AD site to which the CA belongs. This can be used by the enrolling clients to determine the relative cost of communicating with the CA versus CAs that belong to other sites. This value is relevant only for CA objects retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas">GetCAs</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> interface.
     * Native name: CAPropSiteName
     * @type {Integer (Int32)}
     */
    static PropSiteName => 10

    /**
     * A <b>VT_BSTR</b> value that contains the security descriptor definition language (SDDL) string representation of the security descriptor for the CA. This value is relevant only for CA objects retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas">GetCAs</a> method.
     * Native name: CAPropSecurity
     * @type {Integer (Int32)}
     */
    static PropSecurity => 11

    /**
     * A <b>VT_BOOL</b> value that specifies whether a CA is configured to perform only certificate renewals. This value is relevant only for CA objects retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas">GetCAs</a> method.
     * Native name: CAPropRenewalOnly
     * @type {Integer (Int32)}
     */
    static PropRenewalOnly => 12
}
