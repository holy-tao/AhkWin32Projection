#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the set of reasons that a [CoreWindow](corewindow.md)'s [Activated](corewindow_activated.md) event was raised.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowactivationstate
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreWindowActivationState extends Win32Enum{

    /**
     * The window was activated by a call to [Activate](corewindow_activate_1797342875.md).
     * @type {Integer (Int32)}
     */
    static CodeActivated => 0

    /**
     * The window was deactivated.
     * @type {Integer (Int32)}
     */
    static Deactivated => 1

    /**
     * The window was activated by pointer interaction.
     * @type {Integer (Int32)}
     */
    static PointerActivated => 2
}
