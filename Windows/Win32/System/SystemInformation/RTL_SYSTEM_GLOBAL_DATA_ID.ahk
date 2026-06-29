#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct RTL_SYSTEM_GLOBAL_DATA_ID {
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
    static GlobalDataIdUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdRngSeedVersion => 1

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdInterruptTime => 2

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdTimeZoneBias => 3

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdImageNumberLow => 4

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdImageNumberHigh => 5

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdTimeZoneId => 6

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdNtMajorVersion => 7

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdNtMinorVersion => 8

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdSystemExpirationDate => 9

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdKdDebuggerEnabled => 10

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdCyclesPerYield => 11

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdSafeBootMode => 12

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdLastSystemRITEventTickCount => 13

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdConsoleSharedDataFlags => 14

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdNtSystemRootDrive => 15

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdQpcBypassEnabled => 16

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdQpcData => 17

    /**
     * @type {Integer (Int32)}
     */
    static GlobalDataIdQpcBias => 18
}
