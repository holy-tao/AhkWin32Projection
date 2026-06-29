#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Lists the possible security levels.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-mandatory_level
 * @namespace Windows.Win32.Security
 */
export default struct MANDATORY_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
