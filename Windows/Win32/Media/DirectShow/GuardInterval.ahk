#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct GuardInterval {
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
    static BDA_GUARD_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_1_32 => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_1_16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_1_8 => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_1_4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_1_128 => 5

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_19_128 => 6

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_19_256 => 7

    /**
     * @type {Integer (Int32)}
     */
    static BDA_GUARD_MAX => 8
}
