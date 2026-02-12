#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the framework automatically adjusts visual properties for an element when high contrast themes are enabled.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementhighcontrastadjustment
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementHighContrastAdjustment extends Win32BitflagEnum{

    /**
     * No automatic adjustments are made to visuals.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Behavior is inherited from the [Application.HighContrastAdjustment](application_highcontrastadjustment.md) setting.
     * @type {Integer (UInt32)}
     */
    static Application => 2147483648

    /**
     * Visuals are automatically adjusted when high contrast is enabled.
     * @type {Integer (UInt32)}
     */
    static Auto => 4294967295
}
