#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct INK_METRIC_FLAGS {
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
    static IMF_FONT_SELECTED_IN_HDC => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMF_ITALIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMF_BOLD => 4
}
