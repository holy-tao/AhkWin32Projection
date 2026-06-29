#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct TLENUMF {
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
    static TLEF_RELATIVE_INCLUDE_CURRENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_RELATIVE_BACK => 16

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_RELATIVE_FORE => 32

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_INCLUDE_UNINVOKEABLE => 64

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_ABSOLUTE => 49

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_EXCLUDE_SUBFRAME_ENTRIES => 128

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_EXCLUDE_ABOUT_PAGES => 256
}
