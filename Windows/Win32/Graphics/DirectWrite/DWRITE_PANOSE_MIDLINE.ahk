#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_MIDLINE enumeration contains values that specify info about the placement of midline across uppercase characters and the treatment of diagonal stem apexes.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_midline
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_MIDLINE extends Win32Enum {

    /**
     * Any midline.
     * Native name: DWRITE_PANOSE_MIDLINE_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit midline.
     * Native name: DWRITE_PANOSE_MIDLINE_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Standard trimmed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_STANDARD_TRIMMED
     * @type {Integer (Int32)}
     */
    static STANDARD_TRIMMED => 2

    /**
     * Standard pointed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_STANDARD_POINTED
     * @type {Integer (Int32)}
     */
    static STANDARD_POINTED => 3

    /**
     * Standard serifed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_STANDARD_SERIFED
     * @type {Integer (Int32)}
     */
    static STANDARD_SERIFED => 4

    /**
     * High trimmed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_HIGH_TRIMMED
     * @type {Integer (Int32)}
     */
    static HIGH_TRIMMED => 5

    /**
     * High pointed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_HIGH_POINTED
     * @type {Integer (Int32)}
     */
    static HIGH_POINTED => 6

    /**
     * High serifed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_HIGH_SERIFED
     * @type {Integer (Int32)}
     */
    static HIGH_SERIFED => 7

    /**
     * Constant trimmed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_CONSTANT_TRIMMED
     * @type {Integer (Int32)}
     */
    static CONSTANT_TRIMMED => 8

    /**
     * Constant pointed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_CONSTANT_POINTED
     * @type {Integer (Int32)}
     */
    static CONSTANT_POINTED => 9

    /**
     * Constant serifed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_CONSTANT_SERIFED
     * @type {Integer (Int32)}
     */
    static CONSTANT_SERIFED => 10

    /**
     * Low trimmed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_LOW_TRIMMED
     * @type {Integer (Int32)}
     */
    static LOW_TRIMMED => 11

    /**
     * Low pointed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_LOW_POINTED
     * @type {Integer (Int32)}
     */
    static LOW_POINTED => 12

    /**
     * Low serifed midline.
     * Native name: DWRITE_PANOSE_MIDLINE_LOW_SERIFED
     * @type {Integer (Int32)}
     */
    static LOW_SERIFED => 13
}
