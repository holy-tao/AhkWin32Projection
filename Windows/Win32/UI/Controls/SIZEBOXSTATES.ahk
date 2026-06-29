#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct SIZEBOXSTATES {
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
    static SZB_RIGHTALIGN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SZB_LEFTALIGN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SZB_TOPRIGHTALIGN => 3

    /**
     * @type {Integer (Int32)}
     */
    static SZB_TOPLEFTALIGN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SZB_HALFBOTTOMRIGHTALIGN => 5

    /**
     * @type {Integer (Int32)}
     */
    static SZB_HALFBOTTOMLEFTALIGN => 6

    /**
     * @type {Integer (Int32)}
     */
    static SZB_HALFTOPRIGHTALIGN => 7

    /**
     * @type {Integer (Int32)}
     */
    static SZB_HALFTOPLEFTALIGN => 8
}
