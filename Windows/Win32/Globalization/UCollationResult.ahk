#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCollationResult {
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
    static UCOL_EQUAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_GREATER => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_LESS => -1
}
