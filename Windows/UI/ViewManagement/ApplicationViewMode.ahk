#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the view mode of an app window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewmode
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewMode extends Win32Enum{

    /**
     * The app window is in its default mode.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The app window is in a compact overlay (picture-in-picture) mode.
     * @type {Integer (Int32)}
     */
    static CompactOverlay => 1
}
