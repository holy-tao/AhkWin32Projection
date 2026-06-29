#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ETO_OPTIONS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_OPAQUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_CLIPPED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_GLYPH_INDEX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_RTLREADING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_NUMERICSLOCAL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_NUMERICSLATIN => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_IGNORELANGUAGE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_PDY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ETO_REVERSE_INDEX_MAP => 65536
}
