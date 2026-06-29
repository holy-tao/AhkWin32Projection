#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechVisemeType {
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
    static SVP_0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVP_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVP_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVP_3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static SVP_4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static SVP_5 => 5

    /**
     * @type {Integer (Int32)}
     */
    static SVP_6 => 6

    /**
     * @type {Integer (Int32)}
     */
    static SVP_7 => 7

    /**
     * @type {Integer (Int32)}
     */
    static SVP_8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static SVP_9 => 9

    /**
     * @type {Integer (Int32)}
     */
    static SVP_10 => 10

    /**
     * @type {Integer (Int32)}
     */
    static SVP_11 => 11

    /**
     * @type {Integer (Int32)}
     */
    static SVP_12 => 12

    /**
     * @type {Integer (Int32)}
     */
    static SVP_13 => 13

    /**
     * @type {Integer (Int32)}
     */
    static SVP_14 => 14

    /**
     * @type {Integer (Int32)}
     */
    static SVP_15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static SVP_16 => 16

    /**
     * @type {Integer (Int32)}
     */
    static SVP_17 => 17

    /**
     * @type {Integer (Int32)}
     */
    static SVP_18 => 18

    /**
     * @type {Integer (Int32)}
     */
    static SVP_19 => 19

    /**
     * @type {Integer (Int32)}
     */
    static SVP_20 => 20

    /**
     * @type {Integer (Int32)}
     */
    static SVP_21 => 21
}
