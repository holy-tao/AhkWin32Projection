#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify known system color values.
 * @remarks
 * See [UISettings.GetColorValue](uisettings_getcolorvalue_461420534.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uicolortype
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class UIColorType extends Win32Enum{

    /**
     * The background color.
     * @type {Integer (Int32)}
     */
    static Background => 0

    /**
     * The foreground color.
     * @type {Integer (Int32)}
     */
    static Foreground => 1

    /**
     * The darkest accent color.
     * @type {Integer (Int32)}
     */
    static AccentDark3 => 2

    /**
     * The darker accent color.
     * @type {Integer (Int32)}
     */
    static AccentDark2 => 3

    /**
     * The dark accent color.
     * @type {Integer (Int32)}
     */
    static AccentDark1 => 4

    /**
     * The accent color.
     * @type {Integer (Int32)}
     */
    static Accent => 5

    /**
     * The light accent color.
     * @type {Integer (Int32)}
     */
    static AccentLight1 => 6

    /**
     * The lighter accent color.
     * @type {Integer (Int32)}
     */
    static AccentLight2 => 7

    /**
     * The lightest accent color.
     * @type {Integer (Int32)}
     */
    static AccentLight3 => 8

    /**
     * Not supported. Do not use.
     * @type {Integer (Int32)}
     */
    static Complement => 9
}
