#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DATEPICKERPARTS {
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
    static DP_DATETEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DP_DATEBORDER => 2

    /**
     * @type {Integer (Int32)}
     */
    static DP_SHOWCALENDARBUTTONRIGHT => 3
}
