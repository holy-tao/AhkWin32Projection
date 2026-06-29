#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct USentenceBreak {
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
    static U_SB_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_ATERM => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_CLOSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_FORMAT => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_LOWER => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_NUMERIC => 5

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_OLETTER => 6

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_SEP => 7

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_SP => 8

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_STERM => 9

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_UPPER => 10

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_CR => 11

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_EXTEND => 12

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_LF => 13

    /**
     * @type {Integer (Int32)}
     */
    static U_SB_SCONTINUE => 14
}
