#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkCursors {
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
    static DISPID_ICs_NewEnum => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsCount => 1
}
