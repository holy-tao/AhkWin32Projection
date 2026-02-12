#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the types of standard color spaces for display monitors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplaycolorspace
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class HdmiDisplayColorSpace extends Win32Enum{

    /**
     * Limited RGB; levels are limited to 16-235.
     * @type {Integer (Int32)}
     */
    static RgbLimited => 0

    /**
     * Full RGB; levels are in the full range of 0-255.
     * @type {Integer (Int32)}
     */
    static RgbFull => 1

    /**
     * The ITU-R Recommendation BT.2020 is the recommended format for ultra-high-definition TV (UHDTV).
     * @type {Integer (Int32)}
     */
    static BT2020 => 2

    /**
     * The ITU-R Recommendation BT.709 is the recommended format for high-definition TV (HDTV).
     * @type {Integer (Int32)}
     */
    static BT709 => 3
}
