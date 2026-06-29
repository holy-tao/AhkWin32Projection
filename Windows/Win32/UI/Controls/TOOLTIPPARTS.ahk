#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TOOLTIPPARTS {
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
    static TTP_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static TTP_STANDARDTITLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TTP_BALLOON => 3

    /**
     * @type {Integer (Int32)}
     */
    static TTP_BALLOONTITLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static TTP_CLOSE => 5

    /**
     * @type {Integer (Int32)}
     */
    static TTP_BALLOONSTEM => 6

    /**
     * @type {Integer (Int32)}
     */
    static TTP_WRENCH => 7
}
