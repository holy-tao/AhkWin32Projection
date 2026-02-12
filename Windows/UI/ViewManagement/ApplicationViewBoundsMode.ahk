#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The bounds used by the framework to lay out the contents of a window (app view).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewboundsmode
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewBoundsMode extends Win32Enum{

    /**
     * Lay out the window's content within the visible region (that is, the region not occluded by chrome such as the status bar and app bar).
     * @type {Integer (Int32)}
     */
    static UseVisible => 0

    /**
     * Lay out the window's content within the region occupied by the core window (that is, including any occluded areas).
     * @type {Integer (Int32)}
     */
    static UseCoreWindow => 1
}
