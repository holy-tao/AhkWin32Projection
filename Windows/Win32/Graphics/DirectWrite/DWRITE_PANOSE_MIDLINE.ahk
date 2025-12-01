#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_MIDLINE enumeration contains values that specify info about the placement of midline across uppercase characters and the treatment of diagonal stem apexes.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_midline
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_MIDLINE extends Win32Enum{

    /**
     * Any midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_ANY => 0

    /**
     * No fit midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_NO_FIT => 1

    /**
     * Standard trimmed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_STANDARD_TRIMMED => 2

    /**
     * Standard pointed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_STANDARD_POINTED => 3

    /**
     * Standard serifed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_STANDARD_SERIFED => 4

    /**
     * High trimmed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_HIGH_TRIMMED => 5

    /**
     * High pointed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_HIGH_POINTED => 6

    /**
     * High serifed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_HIGH_SERIFED => 7

    /**
     * Constant trimmed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_CONSTANT_TRIMMED => 8

    /**
     * Constant pointed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_CONSTANT_POINTED => 9

    /**
     * Constant serifed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_CONSTANT_SERIFED => 10

    /**
     * Low trimmed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_LOW_TRIMMED => 11

    /**
     * Low pointed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_LOW_POINTED => 12

    /**
     * Low serifed midline.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_MIDLINE_LOW_SERIFED => 13
}
