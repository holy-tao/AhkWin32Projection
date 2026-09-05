#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SYMBOL_KIND enumeration contains values that specify the kind of symbol set.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_symbol_kind
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_SYMBOL_KIND extends Win32Enum {

    /**
     * Any kind of symbol set.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for the kind of symbol set.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * The kind of symbol set is montages.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_MONTAGES
     * @type {Integer (Int32)}
     */
    static MONTAGES => 2

    /**
     * The kind of symbol set is pictures.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_PICTURES
     * @type {Integer (Int32)}
     */
    static PICTURES => 3

    /**
     * The kind of symbol set is shapes.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_SHAPES
     * @type {Integer (Int32)}
     */
    static SHAPES => 4

    /**
     * The kind of symbol set is scientific symbols.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_SCIENTIFIC
     * @type {Integer (Int32)}
     */
    static SCIENTIFIC => 5

    /**
     * The kind of symbol set is music symbols.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_MUSIC
     * @type {Integer (Int32)}
     */
    static MUSIC => 6

    /**
     * The kind of symbol set is expert symbols.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_EXPERT
     * @type {Integer (Int32)}
     */
    static EXPERT => 7

    /**
     * The kind of symbol set is patterns.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_PATTERNS
     * @type {Integer (Int32)}
     */
    static PATTERNS => 8

    /**
     * The kind of symbol set is boarders.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_BOARDERS
     * @type {Integer (Int32)}
     */
    static BOARDERS => 9

    /**
     * The kind of symbol set is icons.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_ICONS
     * @type {Integer (Int32)}
     */
    static ICONS => 10

    /**
     * The kind of symbol set is logos.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_LOGOS
     * @type {Integer (Int32)}
     */
    static LOGOS => 11

    /**
     * The kind of symbol set is industry specific.
     * Native name: DWRITE_PANOSE_SYMBOL_KIND_INDUSTRY_SPECIFIC
     * @type {Integer (Int32)}
     */
    static INDUSTRY_SPECIFIC => 12
}
