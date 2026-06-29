#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVISEMES {
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
    static SP_VISEME_0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_5 => 5

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_6 => 6

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_7 => 7

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_9 => 9

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_10 => 10

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_11 => 11

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_12 => 12

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_13 => 13

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_14 => 14

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_16 => 16

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_17 => 17

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_18 => 18

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_19 => 19

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_20 => 20

    /**
     * @type {Integer (Int32)}
     */
    static SP_VISEME_21 => 21
}
