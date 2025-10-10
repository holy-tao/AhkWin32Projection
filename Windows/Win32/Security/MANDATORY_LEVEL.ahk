#Requires AutoHotkey v2.0.0 64-bit

/**
 * Lists the possible security levels.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-mandatory_level
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class MANDATORY_LEVEL{

    /**
     * The required security level is untrusted.
     * @type {Integer (Int32)}
     */
    static MandatoryLevelUntrusted => 0

    /**
     * The required security level is low.
     * @type {Integer (Int32)}
     */
    static MandatoryLevelLow => 1

    /**
     * The required security level is medium.
     * @type {Integer (Int32)}
     */
    static MandatoryLevelMedium => 2

    /**
     * The required security level is high.
     * @type {Integer (Int32)}
     */
    static MandatoryLevelHigh => 3

    /**
     * The required security level is system.
     * @type {Integer (Int32)}
     */
    static MandatoryLevelSystem => 4

    /**
     * The required security level is a secure process.
     * @type {Integer (Int32)}
     */
    static MandatoryLevelSecureProcess => 5

    /**
     * The count of the mandatory level.
     * @type {Integer (Int32)}
     */
    static MandatoryLevelCount => 6
}
