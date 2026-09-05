#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the current state of the window for purposes of user interaction.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-windowinteractionstate
 * @namespace Windows.Win32.UI.Accessibility
 */
class WindowInteractionState extends Win32Enum {

    /**
     * The window is running. This does not guarantee that the window is ready for user interaction or is responding.
     * Native name: WindowInteractionState_Running
     * @type {Integer (Int32)}
     */
    static Running => 0

    /**
     * The window is closing.
     * Native name: WindowInteractionState_Closing
     * @type {Integer (Int32)}
     */
    static Closing => 1

    /**
     * The window is ready for user interaction.
     * Native name: WindowInteractionState_ReadyForUserInteraction
     * @type {Integer (Int32)}
     */
    static ReadyForUserInteraction => 2

    /**
     * The window is blocked by a modal window.
     * Native name: WindowInteractionState_BlockedByModalWindow
     * @type {Integer (Int32)}
     */
    static BlockedByModalWindow => 3

    /**
     * The window is not responding.
     * Native name: WindowInteractionState_NotResponding
     * @type {Integer (Int32)}
     */
    static NotResponding => 4
}
