#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how a smart card app should be launched.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardlaunchbehavior
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardLaunchBehavior extends Win32Enum{

    /**
     * Default launch behavior.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Launch the app above the lock screen.
     * @type {Integer (Int32)}
     */
    static AboveLock => 1
}
