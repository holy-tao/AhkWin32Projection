#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVCOLUMNW_FORMAT extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_LEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_RIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_CENTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_JUSTIFYMASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_IMAGE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_BITMAP_ON_RIGHT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_COL_HAS_IMAGES => 32768

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_FIXED_WIDTH => 256

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_NO_DPI_SCALE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_FIXED_RATIO => 524288

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_SPLITBUTTON => 16777216
}
