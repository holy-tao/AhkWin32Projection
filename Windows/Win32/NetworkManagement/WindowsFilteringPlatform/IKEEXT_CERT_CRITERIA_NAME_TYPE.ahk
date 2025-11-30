#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of NAME fields possible for a certificate selection &quot;subject&quot; criteria.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ne-iketypes-ikeext_cert_criteria_name_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERT_CRITERIA_NAME_TYPE extends Win32Enum{

    /**
     * DNS name in the Subject Alternative Name of the certificate.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CRITERIA_DNS => 0

    /**
     * UPN name in the Subject Alternative Name of the certificate.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CRITERIA_UPN => 1

    /**
     * RFC 822 name in the Subject Alternative Name of the certificate.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CRITERIA_RFC822 => 2

    /**
     * CN in the Subject of the certificate.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CRITERIA_CN => 3

    /**
     * OU in the Subject of the certificate.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CRITERIA_OU => 4

    /**
     * O in the Subject of the certificate.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CRITERIA_O => 5

    /**
     * DC in the Subject of the certificate.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CRITERIA_DC => 6

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CRITERIA_NAME_TYPE_MAX => 7
}
