#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IURL_SETURL_FLAGS {
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
    static IURL_SETURL_FL_GUESS_PROTOCOL => 1

    /**
     * @type {Integer (Int32)}
     */
    static IURL_SETURL_FL_USE_DEFAULT_PROTOCOL => 2
}
