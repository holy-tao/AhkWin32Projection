#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class HistogramFormat extends Win32Enum {

    /**
     * Native name: HistogramFormatARGB
     * @type {Integer (Int32)}
     */
    static FormatARGB => 0

    /**
     * Native name: HistogramFormatPARGB
     * @type {Integer (Int32)}
     */
    static FormatPARGB => 1

    /**
     * Native name: HistogramFormatRGB
     * @type {Integer (Int32)}
     */
    static FormatRGB => 2

    /**
     * Native name: HistogramFormatGray
     * @type {Integer (Int32)}
     */
    static Gray => 3

    /**
     * Native name: HistogramFormatB
     * @type {Integer (Int32)}
     */
    static FormatB => 4

    /**
     * Native name: HistogramFormatG
     * @type {Integer (Int32)}
     */
    static FormatG => 5

    /**
     * Native name: HistogramFormatR
     * @type {Integer (Int32)}
     */
    static FormatR => 6

    /**
     * Native name: HistogramFormatA
     * @type {Integer (Int32)}
     */
    static FormatA => 7
}
