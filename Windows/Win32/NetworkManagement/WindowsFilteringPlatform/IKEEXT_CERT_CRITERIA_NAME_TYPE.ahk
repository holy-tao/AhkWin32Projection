#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of NAME fields possible for a certificate selection &quot;subject&quot; criteria.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_cert_criteria_name_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_CERT_CRITERIA_NAME_TYPE extends Win32Enum {

    /**
     * DNS name in the Subject Alternative Name of the certificate.
     * Native name: IKEEXT_CERT_CRITERIA_DNS
     * @type {Integer (Int32)}
     */
    static DNS => 0

    /**
     * UPN name in the Subject Alternative Name of the certificate.
     * Native name: IKEEXT_CERT_CRITERIA_UPN
     * @type {Integer (Int32)}
     */
    static UPN => 1

    /**
     * RFC 822 name in the Subject Alternative Name of the certificate.
     * Native name: IKEEXT_CERT_CRITERIA_RFC822
     * @type {Integer (Int32)}
     */
    static RFC822 => 2

    /**
     * CN in the Subject of the certificate.
     * Native name: IKEEXT_CERT_CRITERIA_CN
     * @type {Integer (Int32)}
     */
    static CN => 3

    /**
     * OU in the Subject of the certificate.
     * Native name: IKEEXT_CERT_CRITERIA_OU
     * @type {Integer (Int32)}
     */
    static OU => 4

    /**
     * O in the Subject of the certificate.
     * Native name: IKEEXT_CERT_CRITERIA_O
     * @type {Integer (Int32)}
     */
    static O => 5

    /**
     * DC in the Subject of the certificate.
     * Native name: IKEEXT_CERT_CRITERIA_DC
     * @type {Integer (Int32)}
     */
    static DC => 6

    /**
     * Maximum value for testing purposes.
     * Native name: IKEEXT_CERT_CRITERIA_NAME_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 7
}
