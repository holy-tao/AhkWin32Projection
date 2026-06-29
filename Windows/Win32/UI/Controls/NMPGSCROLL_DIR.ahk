#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMPGSCROLL_DIR {
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
    static PGF_SCROLLDOWN => 2

    /**
     * @type {Integer (Int32)}
     */
    static PGF_SCROLLLEFT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PGF_SCROLLRIGHT => 8

    /**
     * @type {Integer (Int32)}
     */
    static PGF_SCROLLUP => 1
}
