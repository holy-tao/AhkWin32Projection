#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct GET_THEME_BITMAP_FLAGS {
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
    static GBF_DIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GBF_COPY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GBF_VALIDBITS => 3
}
