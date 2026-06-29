#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DRAGDROPPARTS {
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
    static DD_COPY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DD_MOVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DD_UPDATEMETADATA => 3

    /**
     * @type {Integer (Int32)}
     */
    static DD_CREATELINK => 4

    /**
     * @type {Integer (Int32)}
     */
    static DD_WARNING => 5

    /**
     * @type {Integer (Int32)}
     */
    static DD_NONE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DD_IMAGEBG => 7

    /**
     * @type {Integer (Int32)}
     */
    static DD_TEXTBG => 8
}
