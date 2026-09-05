#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class POWER_LIMIT_TYPES extends Win32Enum {

    /**
     * Native name: PowerLimitContinuous
     * @type {Integer (Int32)}
     */
    static Continuous => 0

    /**
     * Native name: PowerLimitType1
     * @type {Integer (Int32)}
     */
    static Type1 => 0

    /**
     * Native name: PowerLimitBurst
     * @type {Integer (Int32)}
     */
    static Burst => 1

    /**
     * Native name: PowerLimitType2
     * @type {Integer (Int32)}
     */
    static Type2 => 1

    /**
     * Native name: PowerLimitRapid
     * @type {Integer (Int32)}
     */
    static Rapid => 2

    /**
     * Native name: PowerLimitType3
     * @type {Integer (Int32)}
     */
    static Type3 => 2

    /**
     * Native name: PowerLimitPreemptive
     * @type {Integer (Int32)}
     */
    static Preemptive => 3

    /**
     * Native name: PowerLimitType4
     * @type {Integer (Int32)}
     */
    static Type4 => 3

    /**
     * Native name: PowerLimitPreemptiveOffset
     * @type {Integer (Int32)}
     */
    static PreemptiveOffset => 4

    /**
     * Native name: PowerLimitTypeMax
     * @type {Integer (Int32)}
     */
    static TypeMax => 5
}
