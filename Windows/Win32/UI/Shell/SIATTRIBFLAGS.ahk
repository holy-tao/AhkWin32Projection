#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SIATTRIBFLAGS {
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
    static SIATTRIBFLAGS_AND => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_OR => 2

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_APPCOMPAT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_MASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static SIATTRIBFLAGS_ALLITEMS => 16384
}
