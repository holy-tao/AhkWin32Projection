#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkRectangle {
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
    static DISPID_IRTop => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRBottom => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRGetRectangle => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRSetRectangle => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRData => 7
}
