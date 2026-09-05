#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Lists the possible security levels.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-mandatory_level
 * @namespace Windows.Win32.Security
 */
class MANDATORY_LEVEL extends Win32Enum {

    /**
     * The required security level is untrusted.
     * Native name: MandatoryLevelUntrusted
     * @type {Integer (Int32)}
     */
    static Untrusted => 0

    /**
     * The required security level is low.
     * Native name: MandatoryLevelLow
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * The required security level is medium.
     * Native name: MandatoryLevelMedium
     * @type {Integer (Int32)}
     */
    static Medium => 2

    /**
     * The required security level is high.
     * Native name: MandatoryLevelHigh
     * @type {Integer (Int32)}
     */
    static High => 3

    /**
     * The required security level is system.
     * Native name: MandatoryLevelSystem
     * @type {Integer (Int32)}
     */
    static System => 4

    /**
     * The required security level is a secure process.
     * Native name: MandatoryLevelSecureProcess
     * @type {Integer (Int32)}
     */
    static SecureProcess => 5

    /**
     * The count of the mandatory level.
     * Native name: MandatoryLevelCount
     * @type {Integer (Int32)}
     */
    static Count => 6
}
