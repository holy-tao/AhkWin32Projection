#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the framework automatically adjusts visual properties for the app when high contrast themes are enabled.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.applicationhighcontrastadjustment
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ApplicationHighContrastAdjustment extends Win32BitflagEnum{

    /**
     * No automatic adjustments are made to visuals.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Visuals are automatically adjusted when high contrast is enabled.
     * @type {Integer (UInt32)}
     */
    static Auto => 4294967295
}
