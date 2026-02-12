#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes the types of shutdown that you can perform for a device that runs in fixed-purpose mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.shutdownkind
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ShutdownKind extends Win32Enum{

    /**
     * Shuts down the fixed-purpose device without restarting the device.
     * @type {Integer (Int32)}
     */
    static Shutdown => 0

    /**
     * Shuts down the fixed-purpose device, then restarts the device.
     * @type {Integer (Int32)}
     */
    static Restart => 1
}
