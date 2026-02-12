#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the horizontal alignment of text on a line display, relative to the current text character position.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayhorizontalalignment
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayHorizontalAlignment extends Win32Enum{

    /**
     * Align the bitmap's left edge with the leftmost pixel of the current charcter position.
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * Align the bitmap in the horizontal center of the current character position.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * Align the bitmap's right edge with the rightmost pixel of the current charcter position.
     * @type {Integer (Int32)}
     */
    static Right => 2
}
