#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Elements of the COLORTYPE enumeration are used to specify types of colors that are available for a soft keyboard.
 * @see https://learn.microsoft.com/windows/win32/TSF/colortype
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct COLORTYPE {
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
    static COLOR_GRAY => 1

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_RGB => 2

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_XYZ => 3

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_Yxy => 4

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_Lab => 5

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_3_CHANNEL => 6

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_CMYK => 7

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_5_CHANNEL => 8

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_6_CHANNEL => 9

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_7_CHANNEL => 10

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_8_CHANNEL => 11

    /**
     * @type {Integer (Int32)}
     */
    static COLOR_NAMED => 12
}
