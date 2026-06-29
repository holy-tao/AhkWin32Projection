#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkCursor {
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
    static DISPID_ICsrName => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrDrawingAttributes => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrButtons => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrInverted => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrTablet => 5
}
