#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that specify the current state of the window for purposes of user or programmatic interaction.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.windowinteractionstate
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class WindowInteractionState extends Win32Enum{

    /**
     * The window is running. This doesn't guarantee that the window is responding or ready for user interaction.
     * @type {Integer (Int32)}
     */
    static Running => 0

    /**
     * The window is closing.
     * @type {Integer (Int32)}
     */
    static Closing => 1

    /**
     * The window is ready for user interaction.
     * @type {Integer (Int32)}
     */
    static ReadyForUserInteraction => 2

    /**
     * The window is blocked by a modal window.
     * @type {Integer (Int32)}
     */
    static BlockedByModalWindow => 3

    /**
     * The window is not responding.
     * @type {Integer (Int32)}
     */
    static NotResponding => 4
}
