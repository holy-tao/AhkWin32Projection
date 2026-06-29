#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BIDI_TYPE {
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
    static BIDI_NULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_INT => 1

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_FLOAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_BOOL => 3

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_STRING => 4

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_TEXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_ENUM => 6

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_BLOB => 7
}
