#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct SCF_BUTTON_IDS {
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
    static SCF_BUTTON_MENU => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_SELECT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_UP => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_DOWN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_LEFT => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_RIGHT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_PLAY => 7

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_PAUSE => 8

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_FASTFORWARD => 9

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_REWIND => 10

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_STOP => 11

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_BACK => 65280
}
