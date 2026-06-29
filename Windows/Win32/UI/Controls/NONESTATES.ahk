#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NONESTATES {
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
    static DDNONE_HIGHLIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDNONE_NOHIGHLIGHT => 2
}
