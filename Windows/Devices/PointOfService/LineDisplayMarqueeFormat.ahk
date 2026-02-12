#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the marquee format for the current window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaymarqueeformat
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayMarqueeFormat extends Win32Enum{

    /**
     * Marquee scrolling is disabled.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The display is populated by walking data from the opposite end of the display as the scrolling direction. For example, if the scrolling direction is Left, then the viewport is filled by bringing characters in from the right side and scrolling them to the left.
     * @type {Integer (Int32)}
     */
    static Walk => 1

    /**
     * The display is populated by placing data. For example, if the scrolling direction is left, then the viewport is filled by placing characters starting at the left side, and beginning scrolling only after the viewport is full.
     * @type {Integer (Int32)}
     */
    static Place => 2
}
