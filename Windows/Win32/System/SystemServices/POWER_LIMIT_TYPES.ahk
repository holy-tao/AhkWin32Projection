#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct POWER_LIMIT_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
