#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_FILL enumeration contains values that specify the type of fill and line treatment.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_panose_fill
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_FILL{

    /**
     * Any fill.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FILL_ANY => 0

    /**
     * No fit for fill.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FILL_NO_FIT => 1

    /**
     * The fill is the standard solid fill.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FILL_STANDARD_SOLID_FILL => 2

    /**
     * No fill.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FILL_NO_FILL => 3

    /**
     * The fill is patterned fill.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FILL_PATTERNED_FILL => 4

    /**
     * The fill is complex fill.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FILL_COMPLEX_FILL => 5

    /**
     * The fill is shaped fill.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FILL_SHAPED_FILL => 6

    /**
     * The fill is drawn distressed.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_FILL_DRAWN_DISTRESSED => 7
}
