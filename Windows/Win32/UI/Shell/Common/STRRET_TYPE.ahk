#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell.Common
 */
export default struct STRRET_TYPE {
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
    static STRRET_WSTR => 0

    /**
     * @type {Integer (Int32)}
     */
    static STRRET_OFFSET => 1

    /**
     * @type {Integer (Int32)}
     */
    static STRRET_CSTR => 2
}
