#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SecureLockIconConstants extends Win32Enum {

    /**
     * Native name: secureLockIconUnsecure
     * @type {Integer (Int32)}
     */
    static Unsecure => 0

    /**
     * Native name: secureLockIconMixed
     * @type {Integer (Int32)}
     */
    static Mixed => 1

    /**
     * Native name: secureLockIconSecureUnknownBits
     * @type {Integer (Int32)}
     */
    static SecureUnknownBits => 2

    /**
     * Native name: secureLockIconSecure40Bit
     * @type {Integer (Int32)}
     */
    static Secure40Bit => 3

    /**
     * Native name: secureLockIconSecure56Bit
     * @type {Integer (Int32)}
     */
    static Secure56Bit => 4

    /**
     * Native name: secureLockIconSecureFortezza
     * @type {Integer (Int32)}
     */
    static SecureFortezza => 5

    /**
     * Native name: secureLockIconSecure128Bit
     * @type {Integer (Int32)}
     */
    static Secure128Bit => 6
}
