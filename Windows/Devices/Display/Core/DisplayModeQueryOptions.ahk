#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify options for a mode query operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymodequeryoptions
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayModeQueryOptions extends Win32BitflagEnum{

    /**
     * Indicates no options.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Indicates that only return modes whose source resolution and target resolution exactly match the connected monitor's native mode should be returned.
     * @type {Integer (UInt32)}
     */
    static OnlyPreferredResolution => 1
}
