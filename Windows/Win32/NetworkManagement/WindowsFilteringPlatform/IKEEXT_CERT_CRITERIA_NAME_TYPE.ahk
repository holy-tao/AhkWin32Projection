#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of NAME fields possible for a certificate selection &quot;subject&quot; criteria.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_cert_criteria_name_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERT_CRITERIA_NAME_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
