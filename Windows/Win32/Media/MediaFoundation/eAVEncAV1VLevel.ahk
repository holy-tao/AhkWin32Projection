#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncAV1VLevel {
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
    static eAVEncAV1VLevel2 => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel2_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel3_1 => 5

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel4 => 8

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel4_1 => 9

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel5 => 12

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel5_1 => 13

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel5_2 => 14

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel5_3 => 15

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel6 => 16

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel6_1 => 17

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel6_2 => 18

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1VLevel6_3 => 19
}
