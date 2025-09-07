#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates a type of certificate configuration.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_cert_config_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERT_CONFIG_TYPE{

    /**
     * An explicit trust list will be used for authentication.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CONFIG_EXPLICIT_TRUST_LIST => 0

    /**
     * The enterprise store will be used as the trust list for authentication.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CONFIG_ENTERPRISE_STORE => 1

    /**
     * The trusted root CA store will be used as the trust list for authentication.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CONFIG_TRUSTED_ROOT_STORE => 2

    /**
     * No certificate authentication in the direction (inbound or outbound) specified by the configuration.
 * 
 * Available only on Windows 7, Windows Server 2008 R2, and later.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CONFIG_UNSPECIFIED => 3

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CERT_CONFIG_TYPE_MAX => 4
}
