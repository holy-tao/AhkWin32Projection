#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TEXTSTYLEPARTS {
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
    static TEXT_MAININSTRUCTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_INSTRUCTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_BODYTITLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_BODYTEXT => 4

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_SECONDARYTEXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_HYPERLINKTEXT => 6

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_EXPANDED => 7

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_LABEL => 8

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_CONTROLLABEL => 9
}
