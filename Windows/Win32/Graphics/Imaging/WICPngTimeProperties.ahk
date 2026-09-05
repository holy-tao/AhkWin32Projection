#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) tIME chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngtimeproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICPngTimeProperties extends Win32Enum {

    /**
     * [VT_UI2] Indicates the year of the last modification.
     * Native name: WICPngTimeYear
     * @type {Integer (Int32)}
     */
    static Year => 1

    /**
     * [VT_UI1] Indicates the month of the last modification.
     * Native name: WICPngTimeMonth
     * @type {Integer (Int32)}
     */
    static Month => 2

    /**
     * [VT_UI1] Indicates day of the last modification.
     * Native name: WICPngTimeDay
     * @type {Integer (Int32)}
     */
    static Day => 3

    /**
     * [VT_UI1] Indicates the hour of the last modification.
     * Native name: WICPngTimeHour
     * @type {Integer (Int32)}
     */
    static Hour => 4

    /**
     * [VT_UI1] Indicates the minute of the last modification.
     * Native name: WICPngTimeMinute
     * @type {Integer (Int32)}
     */
    static Minute => 5

    /**
     * [VT_UI1] Indicates the second of the last modification.
     * Native name: WICPngTimeSecond
     * @type {Integer (Int32)}
     */
    static Second => 6
}
