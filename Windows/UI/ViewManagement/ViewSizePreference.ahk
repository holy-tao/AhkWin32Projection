#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible general window (app view) size preferences.
 * @remarks
 * An "app view" is the displayed portion of a UWP app, and which can be variably sized by the user. A user's screen can have up to 4 app views of variable width displayed simultaneously, with a combined horizontal pixel width equal to that of the display device's horizontal resolution.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.viewsizepreference
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ViewSizePreference extends Win32Enum{

    /**
     * The app does not have a window size preference specified. Windows, rather than the app, sets the size preference, which defaults to **UseHalf**.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The window uses less than 50% of the available horizontal screen pixels.
     * @type {Integer (Int32)}
     */
    static UseLess => 1

    /**
     * The window uses 50% (half) of the available horizontal screen pixels.
     * @type {Integer (Int32)}
     */
    static UseHalf => 2

    /**
     * The window uses more than 50% of the available horizontal screen pixels.
     * @type {Integer (Int32)}
     */
    static UseMore => 3

    /**
     * The window uses the minimum horizontal pixel width (either 320 or 500 pixels) specifies in the app's manifest (such as package.appxmanifest).
     * @type {Integer (Int32)}
     */
    static UseMinimum => 4

    /**
     * The window has no visible component.
     * @type {Integer (Int32)}
     */
    static UseNone => 5

    /**
     * The window uses a custom preferred size specifed in the app.
     * @type {Integer (Int32)}
     */
    static Custom => 6
}
