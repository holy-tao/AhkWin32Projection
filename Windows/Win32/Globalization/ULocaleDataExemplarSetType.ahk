#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct ULocaleDataExemplarSetType {
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
    static ULOCDATA_ES_STANDARD => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ES_AUXILIARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ES_INDEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ES_PUNCTUATION => 3
}
