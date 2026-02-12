#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the use to which the display is being put.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitorusagekind
 * @namespace Windows.Devices.Display
 * @version WindowsRuntime 1.4
 */
class DisplayMonitorUsageKind extends Win32Enum{

    /**
     * Indicates that the display is being used as a standard monitor.
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * Indicates that the display is being used as a head-mounted display.
     * @type {Integer (Int32)}
     */
    static HeadMounted => 1

    /**
     * Indicates that the display is not to be used as part of the Windows desktop, and is designed to be driven by a specific third-party application.
     * @type {Integer (Int32)}
     */
    static SpecialPurpose => 2
}
