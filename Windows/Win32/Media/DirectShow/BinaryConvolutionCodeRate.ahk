#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BinaryConvolutionCodeRate {
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
    static BDA_BCC_RATE_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_1_2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_2_3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_3_4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_3_5 => 4

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_4_5 => 5

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_5_6 => 6

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_5_11 => 7

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_7_8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_1_4 => 9

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_1_3 => 10

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_2_5 => 11

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_6_7 => 12

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_8_9 => 13

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_9_10 => 14

    /**
     * @type {Integer (Int32)}
     */
    static BDA_BCC_RATE_MAX => 15
}
