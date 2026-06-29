#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkDivider {
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
    static DISPID_IInkDivider_Strokes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivider_RecognizerContext => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivider_LineHeight => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IInkDivider_Divide => 4
}
