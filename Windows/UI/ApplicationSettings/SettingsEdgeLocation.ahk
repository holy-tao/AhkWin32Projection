#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the edge of the screen where the Settings charms appear.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingsedgelocation
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class SettingsEdgeLocation extends Win32Enum{

    /**
     * The Settings charm appears on the right edge of the screen.
     * @type {Integer (Int32)}
     */
    static Right => 0

    /**
     * The Settings charm appears on the left edge of the screen.
     * @type {Integer (Int32)}
     */
    static Left => 1
}
