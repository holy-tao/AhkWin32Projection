#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) tIME chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngtimeproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngTimeProperties extends Win32Enum{

    /**
     * [VT_UI2] Indicates the year of the last modification.
     * @type {Integer (Int32)}
     */
    static WICPngTimeYear => 1

    /**
     * [VT_UI1] Indicates the month of the last modification.
     * @type {Integer (Int32)}
     */
    static WICPngTimeMonth => 2

    /**
     * [VT_UI1] Indicates day of the last modification.
     * @type {Integer (Int32)}
     */
    static WICPngTimeDay => 3

    /**
     * [VT_UI1] Indicates the hour of the last modification.
     * @type {Integer (Int32)}
     */
    static WICPngTimeHour => 4

    /**
     * [VT_UI1] Indicates the minute of the last modification.
     * @type {Integer (Int32)}
     */
    static WICPngTimeMinute => 5

    /**
     * [VT_UI1] Indicates the second of the last modification.
     * @type {Integer (Int32)}
     */
    static WICPngTimeSecond => 6
}
