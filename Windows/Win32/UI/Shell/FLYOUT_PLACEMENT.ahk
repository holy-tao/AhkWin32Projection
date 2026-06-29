#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FLYOUT_PLACEMENT {
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
    static FP_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static FP_ABOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FP_BELOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static FP_LEFT => 3

    /**
     * @type {Integer (Int32)}
     */
    static FP_RIGHT => 4
}
