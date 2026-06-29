#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TTLOAD_EMBEDDED_FONT_STATUS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static TTLOAD_FONT_SUBSETTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTLOAD_FONT_IN_SYSSTARTUP => 2
}
