#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the vertical alignment of text on a line display, relative to the current text character position.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplayverticalalignment
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayVerticalAlignment extends Win32Enum{

    /**
     * Align the bitmap's top edge with the topmost pixel of the current charcter position.
     * @type {Integer (Int32)}
     */
    static Top => 0

    /**
     * Align the bitmap in the vertical center of the current character position.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * Align the bitmap's bottom edge with the bottommost pixel of the current charcter position.
     * @type {Integer (Int32)}
     */
    static Bottom => 2
}
