#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GET_STOCK_OBJECT_FLAGS {
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
    static BLACK_BRUSH => 4

    /**
     * @type {Integer (Int32)}
     */
    static DKGRAY_BRUSH => 3

    /**
     * @type {Integer (Int32)}
     */
    static DC_BRUSH => 18

    /**
     * @type {Integer (Int32)}
     */
    static GRAY_BRUSH => 2

    /**
     * @type {Integer (Int32)}
     */
    static HOLLOW_BRUSH => 5

    /**
     * @type {Integer (Int32)}
     */
    static LTGRAY_BRUSH => 1

    /**
     * @type {Integer (Int32)}
     */
    static NULL_BRUSH => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHITE_BRUSH => 0

    /**
     * @type {Integer (Int32)}
     */
    static BLACK_PEN => 7

    /**
     * @type {Integer (Int32)}
     */
    static DC_PEN => 19

    /**
     * @type {Integer (Int32)}
     */
    static NULL_PEN => 8

    /**
     * @type {Integer (Int32)}
     */
    static WHITE_PEN => 6

    /**
     * @type {Integer (Int32)}
     */
    static ANSI_FIXED_FONT => 11

    /**
     * @type {Integer (Int32)}
     */
    static ANSI_VAR_FONT => 12

    /**
     * @type {Integer (Int32)}
     */
    static DEVICE_DEFAULT_FONT => 14

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_GUI_FONT => 17

    /**
     * @type {Integer (Int32)}
     */
    static OEM_FIXED_FONT => 10

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_FONT => 13

    /**
     * @type {Integer (Int32)}
     */
    static SYSTEM_FIXED_FONT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DEFAULT_PALETTE => 15
}
