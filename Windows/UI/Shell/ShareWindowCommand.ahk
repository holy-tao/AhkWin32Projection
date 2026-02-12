#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a window sharing command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommand
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class ShareWindowCommand extends Win32Enum{

    /**
     * Specifies that no command is being indicated.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies a *start sharing* command.
     * 
     * For single-window sharing scenarios (that is, client applications that are capable of sharing only one window from one machine at a time), you can use the **StartSharing** command as a **Swap** command to swap to another window or screen if some other window or screen is already being shared from that machine.
     * @type {Integer (Int32)}
     */
    static StartSharing => 1

    /**
     * Specifies a *stop sharing* command.
     * @type {Integer (Int32)}
     */
    static StopSharing => 2
}
