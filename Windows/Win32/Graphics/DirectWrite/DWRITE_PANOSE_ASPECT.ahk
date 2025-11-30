#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_ASPECT enumeration contains values that specify the ratio between the width and height of the character face.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_aspect
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_ASPECT extends Win32Enum{

    /**
     * Any aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_ANY => 0

    /**
     * No fit for aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_NO_FIT => 1

    /**
     * Super condensed aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_SUPER_CONDENSED => 2

    /**
     * Very condensed aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_VERY_CONDENSED => 3

    /**
     * Condensed aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_CONDENSED => 4

    /**
     * Normal aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_NORMAL => 5

    /**
     * Extended aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_EXTENDED => 6

    /**
     * Very extended aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_VERY_EXTENDED => 7

    /**
     * Super extended aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_SUPER_EXTENDED => 8

    /**
     * Monospace aspect.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_ASPECT_MONOSPACED => 9
}
