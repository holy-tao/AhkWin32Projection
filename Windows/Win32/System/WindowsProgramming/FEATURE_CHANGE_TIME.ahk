#Requires AutoHotkey v2.0.0 64-bit

/**
 * This enumeration is intended for infrastructure use only. (FEATURE_CHANGE_TIME)
 * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/ne-featurestagingapi-feature_change_time
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class FEATURE_CHANGE_TIME{

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_CHANGE_TIME_READ => 0

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_CHANGE_TIME_MODULE_RELOAD => 1

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_CHANGE_TIME_SESSION => 2

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static FEATURE_CHANGE_TIME_REBOOT => 3
}
