#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct GETTEXTEX_FLAGS {
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
    static GT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GT_NOHIDDENTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GT_RAWTEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GT_SELECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GT_USECRLF => 1
}
