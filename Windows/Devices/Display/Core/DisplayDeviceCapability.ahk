#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a capability of a [DisplayDevice](displaydevice.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaydevicecapability
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayDeviceCapability extends Win32Enum{

    /**
     * Indicates that presenting content with a sync interval of zero cancels any pending flips, and instead schedules the content to be flipped on the next V-blank interrupt.
     * @type {Integer (Int32)}
     */
    static FlipOverride => 0
}
