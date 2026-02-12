#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines a set of options for window (app view) switching behaviors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitchingoptions
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewSwitchingOptions extends Win32BitflagEnum{

    /**
     * Perform the standard animated transition between windows upon switching.
     * @type {Integer (UInt32)}
     */
    static Default => 0

    /**
     * Immediately transition between windows without animation.
     * @type {Integer (UInt32)}
     */
    static SkipAnimation => 1

    /**
     * Close the initial window and remove it from the list of recently used apps, and display the window to which the app is switching.
     * @type {Integer (UInt32)}
     */
    static ConsolidateViews => 2
}
