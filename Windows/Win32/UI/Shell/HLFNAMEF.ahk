#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLFNAMEF {
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
    static HLFNAMEF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HLFNAMEF_TRYCACHE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLFNAMEF_TRYPRETTYTARGET => 2

    /**
     * @type {Integer (Int32)}
     */
    static HLFNAMEF_TRYFULLTARGET => 4

    /**
     * @type {Integer (Int32)}
     */
    static HLFNAMEF_TRYWIN95SHORTCUT => 8
}
