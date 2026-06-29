#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UIndicPositionalCategory {
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
    static U_INPC_NA => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_BOTTOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_BOTTOM_AND_LEFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_BOTTOM_AND_RIGHT => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_LEFT => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_LEFT_AND_RIGHT => 5

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_OVERSTRUCK => 6

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_RIGHT => 7

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_TOP => 8

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_TOP_AND_BOTTOM => 9

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_TOP_AND_BOTTOM_AND_RIGHT => 10

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_TOP_AND_LEFT => 11

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_TOP_AND_LEFT_AND_RIGHT => 12

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_TOP_AND_RIGHT => 13

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_VISUAL_ORDER_LEFT => 14

    /**
     * @type {Integer (Int32)}
     */
    static U_INPC_TOP_AND_BOTTOM_AND_LEFT => 15
}
