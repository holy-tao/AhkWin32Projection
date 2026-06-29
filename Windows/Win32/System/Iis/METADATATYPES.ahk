#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct METADATATYPES {
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
    static ALL_METADATA => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWORD_METADATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static STRING_METADATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static BINARY_METADATA => 3

    /**
     * @type {Integer (Int32)}
     */
    static EXPANDSZ_METADATA => 4

    /**
     * @type {Integer (Int32)}
     */
    static MULTISZ_METADATA => 5

    /**
     * @type {Integer (Int32)}
     */
    static INVALID_END_METADATA => 6
}
