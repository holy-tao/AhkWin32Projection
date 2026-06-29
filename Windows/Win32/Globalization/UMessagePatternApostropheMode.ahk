#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UMessagePatternApostropheMode {
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
    static UMSGPAT_APOS_DOUBLE_OPTIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UMSGPAT_APOS_DOUBLE_REQUIRED => 1
}
