#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a color space, typically defined by combinations of three color primaries (red, green, and blue).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformatcolorspace
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayWireFormatColorSpace extends Win32Enum{

    /**
     * Indicates that pixels are encoded for the BT.709 standard color primaries.
     * @type {Integer (Int32)}
     */
    static BT709 => 0

    /**
     * Indicates that pixels are encoded for the BT.2020 standard color primaries.
     * @type {Integer (Int32)}
     */
    static BT2020 => 1

    /**
     * Indicates that pixels are encoded for an exact color space defined in the currently applied color profile.
     * @type {Integer (Int32)}
     */
    static ProfileDefinedWideColorGamut => 2
}
