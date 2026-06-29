#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CPVIEW {
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
    static CPVIEW_CLASSIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static CPVIEW_ALLITEMS => 0

    /**
     * @type {Integer (Int32)}
     */
    static CPVIEW_CATEGORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static CPVIEW_HOME => 1
}
