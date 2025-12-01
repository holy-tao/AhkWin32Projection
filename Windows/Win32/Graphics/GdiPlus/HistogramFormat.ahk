#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class HistogramFormat extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HistogramFormatARGB => 0

    /**
     * @type {Integer (Int32)}
     */
    static HistogramFormatPARGB => 1

    /**
     * @type {Integer (Int32)}
     */
    static HistogramFormatRGB => 2

    /**
     * @type {Integer (Int32)}
     */
    static HistogramFormatGray => 3

    /**
     * @type {Integer (Int32)}
     */
    static HistogramFormatB => 4

    /**
     * @type {Integer (Int32)}
     */
    static HistogramFormatG => 5

    /**
     * @type {Integer (Int32)}
     */
    static HistogramFormatR => 6

    /**
     * @type {Integer (Int32)}
     */
    static HistogramFormatA => 7
}
