#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify various kinds of display monitor hardware descriptor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitordescriptorkind
 * @namespace Windows.Devices.Display
 * @version WindowsRuntime 1.4
 */
class DisplayMonitorDescriptorKind extends Win32Enum{

    /**
     * Indicates that the descriptor contains the monitor's Extended Display Identification Data (EDID).
     * @type {Integer (Int32)}
     */
    static Edid => 0

    /**
     * Indicates that the descriptor contains the monitor's DisplayID data (a superset of EDID).
     * @type {Integer (Int32)}
     */
    static DisplayId => 1
}
