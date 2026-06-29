#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct CARET_FLAGS {
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
    static CARET_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CARET_CUSTOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static CARET_RTL => 2

    /**
     * @type {Integer (Int32)}
     */
    static CARET_ITALIC => 32

    /**
     * @type {Integer (Int32)}
     */
    static CARET_NULL => 64

    /**
     * @type {Integer (Int32)}
     */
    static CARET_ROTATE90 => 128
}
