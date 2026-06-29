#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct VERTSCROLLSTATES {
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
    static VSS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static VSS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static VSS_PUSHED => 3

    /**
     * @type {Integer (Int32)}
     */
    static VSS_DISABLED => 4
}
