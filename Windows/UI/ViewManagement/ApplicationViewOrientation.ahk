#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the set of display orientation modes for a window (app view).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationvieworientation
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewOrientation extends Win32Enum{

    /**
     * The window is in landscape orientation, with the display width greater than the height.
     * @type {Integer (Int32)}
     */
    static Landscape => 0

    /**
     * The window is in portrait orientation, with the display height greater than the width.
     * @type {Integer (Int32)}
     */
    static Portrait => 1
}
