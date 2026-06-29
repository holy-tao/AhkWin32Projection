#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UBiDiOrder {
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
    static UBIDI_LOGICAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_VISUAL => 1
}
