#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the automation landmark types for elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationlandmarktype
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationLandmarkType extends Win32Enum{

    /**
     * No landmark type specified
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Custom landmark type
     * @type {Integer (Int32)}
     */
    static Custom => 1

    /**
     * Form landmark type
     * @type {Integer (Int32)}
     */
    static Form => 2

    /**
     * Main page landmark type
     * @type {Integer (Int32)}
     */
    static Main => 3

    /**
     * Navigation landmark type
     * @type {Integer (Int32)}
     */
    static Navigation => 4

    /**
     * Search landmark type
     * @type {Integer (Int32)}
     */
    static Search => 5
}
