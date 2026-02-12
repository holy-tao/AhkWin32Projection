#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify options for the [DisplayManager](displaymanager.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanageroptions
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayManagerOptions extends Win32BitflagEnum{

    /**
     * Specifies no options.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Restricts scanout to devices created by this [DisplayManager](displaymanager.md) object, or to [DisplaySource](displaysource.md) objects created using a shared handle provided by a path owned by this **DisplayManager**.
     * @type {Integer (UInt32)}
     */
    static EnforceSourceOwnership => 1

    /**
     * Specifies that the client is virtual refresh rate aware, and can handle more advanced definitions of refresh rate. This lets you better use operating system functionality to virtualize refresh rate if the graphics stack supports it.
     * @type {Integer (UInt32)}
     */
    static VirtualRefreshRateAware => 2
}
