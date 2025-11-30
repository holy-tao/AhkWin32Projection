#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class POWER_LIMIT_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitContinuous => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitType1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitBurst => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitType2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitRapid => 2

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitType3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitPreemptive => 3

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitType4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitPreemptiveOffset => 4

    /**
     * @type {Integer (Int32)}
     */
    static PowerLimitTypeMax => 5
}
