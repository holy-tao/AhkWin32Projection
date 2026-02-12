#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies when a [CustomSystemEventTrigger](customsystemeventtrigger.md) may be activated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.customsystemeventtriggerrecurrence
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class CustomSystemEventTriggerRecurrence extends Win32Enum{

    /**
     * The trigger can only be activated once per session.
     * @type {Integer (Int32)}
     */
    static Once => 0

    /**
     * The trigger can always be activated.
     * @type {Integer (Int32)}
     */
    static Always => 1
}
