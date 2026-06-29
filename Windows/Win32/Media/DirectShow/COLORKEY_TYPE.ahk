#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct COLORKEY_TYPE {
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
    static CK_NOCOLORKEY => 0

    /**
     * @type {Integer (Int32)}
     */
    static CK_INDEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static CK_RGB => 2
}
