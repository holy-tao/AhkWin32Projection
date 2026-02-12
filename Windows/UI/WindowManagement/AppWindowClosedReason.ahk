#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how a window close operation was initiated.
 * @remarks
 * This enumeration provides values for the [AppWindowClosedEventArgs.Reason](appwindowclosedeventargs_reason.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowclosedreason
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowClosedReason extends Win32Enum{

    /**
     * The operation was initiated by something other than the user or app code.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * The operation was initiated programmatically by code in the app.
     * @type {Integer (Int32)}
     */
    static AppInitiated => 1

    /**
     * The operation was initiated by the user.
     * @type {Integer (Int32)}
     */
    static UserInitiated => 2
}
