#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.LicenseProtection
 */
class LicenseProtectionStatus extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Native name: LicenseKeyNotFound
     * @type {Integer (Int32)}
     */
    static KeyNotFound => 1

    /**
     * Native name: LicenseKeyUnprotected
     * @type {Integer (Int32)}
     */
    static KeyUnprotected => 2

    /**
     * Native name: LicenseKeyCorrupted
     * @type {Integer (Int32)}
     */
    static KeyCorrupted => 3

    /**
     * Native name: LicenseKeyAlreadyExists
     * @type {Integer (Int32)}
     */
    static KeyAlreadyExists => 4
}
