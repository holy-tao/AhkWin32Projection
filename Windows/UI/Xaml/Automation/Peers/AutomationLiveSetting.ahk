#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes the notification characteristics of a particular live region in an app UI. Used by [GetLiveSetting](automationpeer_getlivesetting_295263812.md) and [AutomationProperties.LiveSetting](/uwp/api/windows.ui.xaml.automation.automationproperties.livesetting).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationlivesetting
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationLiveSetting extends Win32Enum{

    /**
     * The element does not send notifications if the content of the live region has changed.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * The element sends non-interruptive notifications if the content of the live region has changed. With this setting, Microsoft UI Automation clients and assistive technology are expected to not interrupt the user to inform of changes to the live region.
     * @type {Integer (Int32)}
     */
    static Polite => 1

    /**
     * The element sends interruptive notifications if the content of the live region has changed. With this setting, Microsoft UI Automation clients and assistive technology are expected to interrupt the user to inform of changes to the live region.
     * @type {Integer (Int32)}
     */
    static Assertive => 2
}
