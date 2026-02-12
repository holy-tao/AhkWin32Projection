#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify which keyboard shortcuts for formatting are disabled in a [RichEditBox](richeditbox.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.disabledformattingaccelerators
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DisabledFormattingAccelerators extends Win32BitflagEnum{

    /**
     * No keyboard shortcuts are disabled.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The keyboard shortcut for bold (Ctrl+B) is disabled.
     * @type {Integer (UInt32)}
     */
    static Bold => 1

    /**
     * The keyboard shortcut for italic (Ctrl+I) is disabled.
     * @type {Integer (UInt32)}
     */
    static Italic => 2

    /**
     * The keyboard shortcut for underline (Ctrl+U) is disabled.
     * @type {Integer (UInt32)}
     */
    static Underline => 4

    /**
     * All keyboard shortcuts are disabled.
     * @type {Integer (UInt32)}
     */
    static All => 4294967295
}
