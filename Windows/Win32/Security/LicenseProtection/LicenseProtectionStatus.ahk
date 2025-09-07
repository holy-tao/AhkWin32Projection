#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.LicenseProtection
 * @version v4.0.30319
 */
class LicenseProtectionStatus{

    /**
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * @type {Integer (Int32)}
     */
    static LicenseKeyNotFound => 1

    /**
     * @type {Integer (Int32)}
     */
    static LicenseKeyUnprotected => 2

    /**
     * @type {Integer (Int32)}
     */
    static LicenseKeyCorrupted => 3

    /**
     * @type {Integer (Int32)}
     */
    static LicenseKeyAlreadyExists => 4
}
