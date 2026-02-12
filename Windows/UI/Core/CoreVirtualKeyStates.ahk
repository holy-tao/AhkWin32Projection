#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies flags for indicating the possible states of a virtual key.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corevirtualkeystates
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreVirtualKeyStates extends Win32BitflagEnum{

    /**
     * The key is up or in no specific state.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The key is pressed down for the input event.
     * @type {Integer (UInt32)}
     */
    static Down => 1

    /**
     * The key is in a toggled or modified state (for example, Caps Lock) for the input event.
     * @type {Integer (UInt32)}
     */
    static Locked => 2
}
