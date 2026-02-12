#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the values for focus mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focusmode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class FocusMode extends Win32Enum{

    /**
     * Use autofocus.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Focus once.
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * Continuously adjust focus.
     * @type {Integer (Int32)}
     */
    static Continuous => 2

    /**
     * Use manual focus.
     * @type {Integer (Int32)}
     */
    static Manual => 3
}
