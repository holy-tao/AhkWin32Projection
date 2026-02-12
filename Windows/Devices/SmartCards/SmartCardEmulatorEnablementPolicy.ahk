#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the current card emulation policy set by the user in the phone settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorenablementpolicy
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulatorEnablementPolicy extends Win32Enum{

    /**
     * Card emulation is disabled.
     * @type {Integer (Int32)}
     */
    static Never => 0

    /**
     * Card emulation is always on.
     * @type {Integer (Int32)}
     */
    static Always => 1

    /**
     * Card emulation is only on when the phone screen is on.
     * @type {Integer (Int32)}
     */
    static ScreenOn => 2

    /**
     * Card emulation is only on when the phone screen is unlocked.
     * @type {Integer (Int32)}
     */
    static ScreenUnlocked => 3
}
