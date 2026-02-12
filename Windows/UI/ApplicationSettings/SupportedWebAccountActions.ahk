#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies actions that your app enables on an web account instance in the account settings pane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.supportedwebaccountactions
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class SupportedWebAccountActions extends Win32BitflagEnum{

    /**
     * No action.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The app attempts to connect to the web account.
     * @type {Integer (UInt32)}
     */
    static Reconnect => 1

    /**
     * The app removes the web account from the account settings pane.
     * @type {Integer (UInt32)}
     */
    static Remove => 2

    /**
     * The app displays details about the web account.
     * @type {Integer (UInt32)}
     */
    static ViewDetails => 4

    /**
     * The app displays UI for managing the web account.
     * @type {Integer (UInt32)}
     */
    static Manage => 8

    /**
     * The app does a custom action with the web account.
     * @type {Integer (UInt32)}
     */
    static More => 16
}
