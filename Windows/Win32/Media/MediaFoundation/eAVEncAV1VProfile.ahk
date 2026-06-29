#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncAV1VProfile {
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
    static eAVEncAV1VProfile_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Main_420_8 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Main_420_10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Main_400_8 => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Main_400_10 => 4

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_High_444_8 => 5

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_High_444_10 => 6

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_420_12 => 7

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_400_12 => 8

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_444_12 => 9

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_422_8 => 10

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_422_10 => 11

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VProfile_Professional_422_12 => 12
}
