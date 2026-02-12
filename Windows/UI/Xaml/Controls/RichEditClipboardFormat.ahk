#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the format of text copied from a [RichEditBox](richeditbox.md).
 * @remarks
 * This enumeration provides values for the [RichEditBox.ClipboardCopyFormat](richeditbox_clipboardcopyformat.md) property. For more info, see [ClipboardCopyFormat](richeditbox_clipboardcopyformat.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditclipboardformat
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RichEditClipboardFormat extends Win32Enum{

    /**
     * Text is copied as both plain text and rich text.
     * @type {Integer (Int32)}
     */
    static AllFormats => 0

    /**
     * Text is copied only as plain text.
     * @type {Integer (Int32)}
     */
    static PlainText => 1
}
