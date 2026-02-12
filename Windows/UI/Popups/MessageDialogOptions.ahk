#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies less frequently used options for a [MessageDialog](messagedialog.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialogoptions
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class MessageDialogOptions extends Win32BitflagEnum{

    /**
     * No options are specified and default behavior is used.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Ignore user input for a short period. This enables browsers to defend against clickjacking.
     * @type {Integer (UInt32)}
     */
    static AcceptUserInputAfterDelay => 1
}
