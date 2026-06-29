#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct MLCONVCHAR {
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
    static MLCONVCHARF_AUTODETECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_ENTITIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_NCR_ENTITIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_NAME_ENTITIZE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_USEDEFCHAR => 8

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_NOBESTFITCHARS => 16

    /**
     * @type {Integer (Int32)}
     */
    static MLCONVCHARF_DETECTJPN => 32
}
