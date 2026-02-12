#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies actions that your app does on an web account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountaction
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class WebAccountAction extends Win32Enum{

    /**
     * The app attempts to connect to the web account.
     * @type {Integer (Int32)}
     */
    static Reconnect => 0

    /**
     * The app removes the web account from the account settings pane.
     * @type {Integer (Int32)}
     */
    static Remove => 1

    /**
     * The app displays details about the web account.
     * @type {Integer (Int32)}
     */
    static ViewDetails => 2

    /**
     * The app displays UI for managing the web account.
     * @type {Integer (Int32)}
     */
    static Manage => 3

    /**
     * The app does a custom action with the web account.
     * @type {Integer (Int32)}
     */
    static More => 4
}
