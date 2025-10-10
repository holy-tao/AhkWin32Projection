#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class WSC_SECURITY_PROVIDER{

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_FIREWALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_AUTOUPDATE_SETTINGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_ANTIVIRUS => 4

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_ANTISPYWARE => 8

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_INTERNET_SETTINGS => 16

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_USER_ACCOUNT_CONTROL => 32

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_SERVICE => 64

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_ALL => 127
}
