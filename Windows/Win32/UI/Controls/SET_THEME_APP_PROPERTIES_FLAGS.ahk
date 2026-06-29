#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct SET_THEME_APP_PROPERTIES_FLAGS {
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
    static ALLOW_NONCLIENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOW_CONTROLS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOW_WEBCONTENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VALIDBITS => 7
}
