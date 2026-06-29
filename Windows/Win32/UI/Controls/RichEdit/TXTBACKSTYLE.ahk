#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct TXTBACKSTYLE {
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
    static TXTBACK_TRANSPARENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TXTBACK_OPAQUE => 1
}
