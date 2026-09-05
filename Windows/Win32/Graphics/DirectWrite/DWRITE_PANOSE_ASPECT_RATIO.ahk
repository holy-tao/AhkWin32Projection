#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_ASPECT_RATIO enumeration contains values that specify info about the ratio between width and height of the character face.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_aspect_ratio
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_ASPECT_RATIO extends Win32Enum {

    /**
     * Any aspect ratio.
     * Native name: DWRITE_PANOSE_ASPECT_RATIO_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for aspect ratio.
     * Native name: DWRITE_PANOSE_ASPECT_RATIO_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Very condensed aspect ratio.
     * Native name: DWRITE_PANOSE_ASPECT_RATIO_VERY_CONDENSED
     * @type {Integer (Int32)}
     */
    static VERY_CONDENSED => 2

    /**
     * Condensed aspect ratio.
     * Native name: DWRITE_PANOSE_ASPECT_RATIO_CONDENSED
     * @type {Integer (Int32)}
     */
    static CONDENSED => 3

    /**
     * Normal aspect ratio.
     * Native name: DWRITE_PANOSE_ASPECT_RATIO_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 4

    /**
     * Expanded aspect ratio.
     * Native name: DWRITE_PANOSE_ASPECT_RATIO_EXPANDED
     * @type {Integer (Int32)}
     */
    static EXPANDED => 5

    /**
     * Very expanded aspect ratio.
     * Native name: DWRITE_PANOSE_ASPECT_RATIO_VERY_EXPANDED
     * @type {Integer (Int32)}
     */
    static VERY_EXPANDED => 6
}
