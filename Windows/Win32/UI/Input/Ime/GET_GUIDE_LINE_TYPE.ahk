#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct GET_GUIDE_LINE_TYPE {
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
    static GGL_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GGL_INDEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GGL_STRING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GGL_PRIVATE => 4
}
