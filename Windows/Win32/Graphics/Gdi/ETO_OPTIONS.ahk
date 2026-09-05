#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class ETO_OPTIONS extends Win32BitflagEnum {

    /**
     * Native name: ETO_OPAQUE
     * @type {Integer (UInt32)}
     */
    static OPAQUE => 2

    /**
     * Native name: ETO_CLIPPED
     * @type {Integer (UInt32)}
     */
    static CLIPPED => 4

    /**
     * Native name: ETO_GLYPH_INDEX
     * @type {Integer (UInt32)}
     */
    static GLYPH_INDEX => 16

    /**
     * Native name: ETO_RTLREADING
     * @type {Integer (UInt32)}
     */
    static RTLREADING => 128

    /**
     * Native name: ETO_NUMERICSLOCAL
     * @type {Integer (UInt32)}
     */
    static NUMERICSLOCAL => 1024

    /**
     * Native name: ETO_NUMERICSLATIN
     * @type {Integer (UInt32)}
     */
    static NUMERICSLATIN => 2048

    /**
     * Native name: ETO_IGNORELANGUAGE
     * @type {Integer (UInt32)}
     */
    static IGNORELANGUAGE => 4096

    /**
     * Native name: ETO_PDY
     * @type {Integer (UInt32)}
     */
    static PDY => 8192

    /**
     * Native name: ETO_REVERSE_INDEX_MAP
     * @type {Integer (UInt32)}
     */
    static REVERSE_INDEX_MAP => 65536
}
