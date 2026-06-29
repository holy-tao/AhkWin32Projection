#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct GETTEXTLENGTHEX_FLAGS {
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
    static GTL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_USECRLF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_PRECISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_CLOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_NUMCHARS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GTL_NUMBYTES => 16
}
