#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate whether spatial sound is on, off, or handled automatically.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementspatialaudiomode
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementSpatialAudioMode extends Win32Enum{

    /**
     * Spatial sound is turned on or off by the system.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Spatial sound is off.
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * Spatial sound is on.
     * @type {Integer (Int32)}
     */
    static On => 2
}
