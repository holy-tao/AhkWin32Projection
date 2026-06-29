#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct AnnoScope {
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
    static ANNO_THIS => 0

    /**
     * @type {Integer (Int32)}
     */
    static ANNO_CONTAINER => 1
}
