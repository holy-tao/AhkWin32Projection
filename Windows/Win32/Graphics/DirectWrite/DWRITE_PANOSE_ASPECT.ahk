#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_ASPECT enumeration contains values that specify the ratio between the width and height of the character face.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_aspect
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_ASPECT extends Win32Enum {

    /**
     * Any aspect.
     * Native name: DWRITE_PANOSE_ASPECT_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for aspect.
     * Native name: DWRITE_PANOSE_ASPECT_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Super condensed aspect.
     * Native name: DWRITE_PANOSE_ASPECT_SUPER_CONDENSED
     * @type {Integer (Int32)}
     */
    static SUPER_CONDENSED => 2

    /**
     * Very condensed aspect.
     * Native name: DWRITE_PANOSE_ASPECT_VERY_CONDENSED
     * @type {Integer (Int32)}
     */
    static VERY_CONDENSED => 3

    /**
     * Condensed aspect.
     * Native name: DWRITE_PANOSE_ASPECT_CONDENSED
     * @type {Integer (Int32)}
     */
    static CONDENSED => 4

    /**
     * Normal aspect.
     * Native name: DWRITE_PANOSE_ASPECT_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 5

    /**
     * Extended aspect.
     * Native name: DWRITE_PANOSE_ASPECT_EXTENDED
     * @type {Integer (Int32)}
     */
    static EXTENDED => 6

    /**
     * Very extended aspect.
     * Native name: DWRITE_PANOSE_ASPECT_VERY_EXTENDED
     * @type {Integer (Int32)}
     */
    static VERY_EXTENDED => 7

    /**
     * Super extended aspect.
     * Native name: DWRITE_PANOSE_ASPECT_SUPER_EXTENDED
     * @type {Integer (Int32)}
     */
    static SUPER_EXTENDED => 8

    /**
     * Monospace aspect.
     * Native name: DWRITE_PANOSE_ASPECT_MONOSPACED
     * @type {Integer (Int32)}
     */
    static MONOSPACED => 9
}
