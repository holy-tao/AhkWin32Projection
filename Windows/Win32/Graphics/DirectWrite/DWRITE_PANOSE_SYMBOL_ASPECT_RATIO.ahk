#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SYMBOL_ASPECT_RATIO enumeration contains values that specify the aspect ratio of symbolic characters.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_symbol_aspect_ratio
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_SYMBOL_ASPECT_RATIO extends Win32Enum {

    /**
     * Any aspect ratio of symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for aspect ratio of symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * No width aspect ratio of symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NO_WIDTH
     * @type {Integer (Int32)}
     */
    static NO_WIDTH => 2

    /**
     * Exceptionally wide symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_EXCEPTIONALLY_WIDE
     * @type {Integer (Int32)}
     */
    static EXCEPTIONALLY_WIDE => 3

    /**
     * Super wide symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_SUPER_WIDE
     * @type {Integer (Int32)}
     */
    static SUPER_WIDE => 4

    /**
     * Very wide symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_VERY_WIDE
     * @type {Integer (Int32)}
     */
    static VERY_WIDE => 5

    /**
     * Wide symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_WIDE
     * @type {Integer (Int32)}
     */
    static WIDE => 6

    /**
     * Normal aspect ratio of symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 7

    /**
     * Narrow symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NARROW
     * @type {Integer (Int32)}
     */
    static NARROW => 8

    /**
     * Very narrow symbolic characters.
     * Native name: DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_VERY_NARROW
     * @type {Integer (Int32)}
     */
    static VERY_NARROW => 9
}
