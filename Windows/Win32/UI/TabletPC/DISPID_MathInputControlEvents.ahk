#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_MathInputControlEvents {
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
    static DISPID_MICInsert => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MICClose => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MICPaint => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_MICClear => 3
}
