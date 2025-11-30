#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_SYMBOL_ASPECT_RATIO enumeration contains values that specify the aspect ratio of symbolic characters.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_symbol_aspect_ratio
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_SYMBOL_ASPECT_RATIO extends Win32Enum{

    /**
     * Any aspect ratio of symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_ANY => 0

    /**
     * No fit for aspect ratio of symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NO_FIT => 1

    /**
     * No width aspect ratio of symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NO_WIDTH => 2

    /**
     * Exceptionally wide symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_EXCEPTIONALLY_WIDE => 3

    /**
     * Super wide symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_SUPER_WIDE => 4

    /**
     * Very wide symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_VERY_WIDE => 5

    /**
     * Wide symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_WIDE => 6

    /**
     * Normal aspect ratio of symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NORMAL => 7

    /**
     * Narrow symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_NARROW => 8

    /**
     * Very narrow symbolic characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_SYMBOL_ASPECT_RATIO_VERY_NARROW => 9
}
