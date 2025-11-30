#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ETO_OPTIONS extends Win32BitflagEnum{

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
