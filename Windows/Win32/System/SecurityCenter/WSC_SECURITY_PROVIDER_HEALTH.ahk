#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class WSC_SECURITY_PROVIDER_HEALTH{

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_HEALTH_GOOD => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_HEALTH_NOTMONITORED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_HEALTH_POOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_HEALTH_SNOOZE => 3
}
