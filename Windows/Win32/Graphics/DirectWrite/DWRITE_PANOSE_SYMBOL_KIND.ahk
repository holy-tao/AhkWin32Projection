#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_SYMBOL_KIND enumeration contains values that specify the kind of symbol set.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_symbol_kind
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_SYMBOL_KIND{

    /**
     * Any kind of symbol set.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_ANY => 0

    /**
     * No fit for the kind of symbol set.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_NO_FIT => 1

    /**
     * The kind of symbol set is montages.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_MONTAGES => 2

    /**
     * The kind of symbol set is pictures.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_PICTURES => 3

    /**
     * The kind of symbol set is shapes.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_SHAPES => 4

    /**
     * The kind of symbol set is scientific symbols.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_SCIENTIFIC => 5

    /**
     * The kind of symbol set is music symbols.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_MUSIC => 6

    /**
     * The kind of symbol set is expert symbols.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_EXPERT => 7

    /**
     * The kind of symbol set is patterns.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_PATTERNS => 8

    /**
     * The kind of symbol set is boarders.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_BOARDERS => 9

    /**
     * The kind of symbol set is icons.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_ICONS => 10

    /**
     * The kind of symbol set is logos.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_LOGOS => 11

    /**
     * The kind of symbol set is industry specific.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_KIND_INDUSTRY_SPECIFIC => 12
}
