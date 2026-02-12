#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the set of app view state changes that can be handled.
  * 
  * > [!IMPORTANT]
  * > ApplicationViewState may be altered or unavailable for releases after Windows 8.1. Instead, query for window layout sizes directly.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewstate
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewState extends Win32Enum{

    /**
     * The current app's view is in full-screen (has no snapped app adjacent to it), and has changed to landscape orientation.
     * @type {Integer (Int32)}
     */
    static FullScreenLandscape => 0

    /**
     * The current app's view has been reduced to a partial screen view as the result of another app snapping.
     * @type {Integer (Int32)}
     */
    static Filled => 1

    /**
     * The current app's view has been snapped.
     * @type {Integer (Int32)}
     */
    static Snapped => 2

    /**
     * The current app's view is in full-screen (has no snapped app adjacent to it), and has changed to portrait orientation.
     * @type {Integer (Int32)}
     */
    static FullScreenPortrait => 3
}
