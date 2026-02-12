#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the preferred writing hand, as specified by the user in **Settings -> Devices -> Pen & Windows Ink -> Choose which hand you write with**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.penhandedness
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class PenHandedness extends Win32Enum{

    /**
     * The user prefers to write with their right hand.
     * @type {Integer (Int32)}
     */
    static Right => 0

    /**
     * The user prefers to write with their left hand.
     * @type {Integer (Int32)}
     */
    static Left => 1
}
