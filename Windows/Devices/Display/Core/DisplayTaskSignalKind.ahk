#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a signal kind.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytasksignalkind
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayTaskSignalKind extends Win32Enum{

    /**
     * Specifies a signal that flips away on *Present*.
     * @type {Integer (Int32)}
     */
    static OnPresentFlipAway => 0

    /**
     * Introduced in **Windows.Foundation.UniversalApiContract**, version 12.
     * 
     * Specifies a signal that flips to on *Present*.
     * @type {Integer (Int32)}
     */
    static OnPresentFlipTo => 1
}
