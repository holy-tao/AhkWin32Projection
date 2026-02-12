#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the app window is auto-sized, full-screen, or set to a specific size on launch.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewwindowingmode
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewWindowingMode extends Win32Enum{

    /**
     * The system sizes the app window automatically.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The window is sized as specified by the [ApplicationView.PreferredLaunchViewSize](applicationview_preferredlaunchviewsize.md) property.
     * @type {Integer (Int32)}
     */
    static PreferredLaunchViewSize => 1

    /**
     * The window is full-screen.
     * @type {Integer (Int32)}
     */
    static FullScreen => 2

    /**
     * The window is shown as a compact overlay (picture-in-picture).
     * @type {Integer (Int32)}
     */
    static CompactOverlay => 3

    /**
     * The window is maximized.
     * @type {Integer (Int32)}
     */
    static Maximized => 4
}
