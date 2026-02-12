#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the activation state of a window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowactivationmode
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreWindowActivationMode extends Win32Enum{

    /**
     * No state is specified.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The window is deactivated.
     * @type {Integer (Int32)}
     */
    static Deactivated => 1

    /**
     * The window is activated, but not in the foreground.
     * @type {Integer (Int32)}
     */
    static ActivatedNotForeground => 2

    /**
     * The window is activated and in the foreground.
     * @type {Integer (Int32)}
     */
    static ActivatedInForeground => 3
}
