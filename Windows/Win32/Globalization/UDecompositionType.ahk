#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDecompositionType {
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
    static U_DT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_CANONICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_COMPAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_CIRCLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_FINAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_FONT => 5

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_FRACTION => 6

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_INITIAL => 7

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_ISOLATED => 8

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_MEDIAL => 9

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_NARROW => 10

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_NOBREAK => 11

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_SMALL => 12

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_SQUARE => 13

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_SUB => 14

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_SUPER => 15

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_VERTICAL => 16

    /**
     * @type {Integer (Int32)}
     */
    static U_DT_WIDE => 17
}
