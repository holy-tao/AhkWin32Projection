#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkCursorButton {
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
    static DISPID_ICBName => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICBId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICBState => 2
}
