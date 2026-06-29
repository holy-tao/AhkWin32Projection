#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct DISPLAY_MOVEUNIT {
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
    static DISPLAY_MOVEUNIT_PreviousLine => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_MOVEUNIT_NextLine => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_MOVEUNIT_CurrentLineStart => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_MOVEUNIT_CurrentLineEnd => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_MOVEUNIT_TopOfWindow => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_MOVEUNIT_BottomOfWindow => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_MOVEUNIT_Max => 2147483647
}
