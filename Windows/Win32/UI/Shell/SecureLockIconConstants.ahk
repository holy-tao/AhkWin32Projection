#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SecureLockIconConstants extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static secureLockIconUnsecure => 0

    /**
     * @type {Integer (Int32)}
     */
    static secureLockIconMixed => 1

    /**
     * @type {Integer (Int32)}
     */
    static secureLockIconSecureUnknownBits => 2

    /**
     * @type {Integer (Int32)}
     */
    static secureLockIconSecure40Bit => 3

    /**
     * @type {Integer (Int32)}
     */
    static secureLockIconSecure56Bit => 4

    /**
     * @type {Integer (Int32)}
     */
    static secureLockIconSecureFortezza => 5

    /**
     * @type {Integer (Int32)}
     */
    static secureLockIconSecure128Bit => 6
}
