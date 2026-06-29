#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct QITIPF_FLAGS {
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
    static QITIPF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static QITIPF_USENAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static QITIPF_LINKNOTARGET => 2

    /**
     * @type {Integer (Int32)}
     */
    static QITIPF_LINKUSETARGET => 4

    /**
     * @type {Integer (Int32)}
     */
    static QITIPF_USESLOWTIP => 8

    /**
     * @type {Integer (Int32)}
     */
    static QITIPF_SINGLELINE => 16

    /**
     * @type {Integer (Int32)}
     */
    static QIF_CACHED => 1

    /**
     * @type {Integer (Int32)}
     */
    static QIF_DONTEXPANDFOLDER => 2
}
