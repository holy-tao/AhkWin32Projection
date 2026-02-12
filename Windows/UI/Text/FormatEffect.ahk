#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the state of a character or paragraph formatting property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.formateffect
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class FormatEffect extends Win32Enum{

    /**
     * Turns off the property.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Turns on the property.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * Toggles the current setting.
     * @type {Integer (Int32)}
     */
    static Toggle => 2

    /**
     * No change.
     * @type {Integer (Int32)}
     */
    static Undefined => 3
}
