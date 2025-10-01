#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class POWER_LIMIT_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitContinuous => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitBurst => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitRapid => 2

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitPreemptive => 3

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitPreemptiveOffset => 4

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitTypeMax => 5
}
