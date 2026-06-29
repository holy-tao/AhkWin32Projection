#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct EDITBALLOONTIP_ICON {
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
    static TTI_ERROR => 3

    /**
     * @type {Integer (Int32)}
     */
    static TTI_INFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static TTI_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TTI_WARNING => 2

    /**
     * @type {Integer (Int32)}
     */
    static TTI_INFO_LARGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static TTI_WARNING_LARGE => 5

    /**
     * @type {Integer (Int32)}
     */
    static TTI_ERROR_LARGE => 6
}
