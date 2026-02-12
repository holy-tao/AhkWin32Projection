#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the outline style.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationoutlinestyles
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationOutlineStyles extends Win32Enum{

    /**
     * No outline.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Standard outline.
     * @type {Integer (Int32)}
     */
    static Outline => 1

    /**
     * Drop shadow.
     * @type {Integer (Int32)}
     */
    static Shadow => 2

    /**
     * Engraved outline.
     * @type {Integer (Int32)}
     */
    static Engraved => 3

    /**
     * Embossed outline.
     * @type {Integer (Int32)}
     */
    static Embossed => 4
}
