#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether text wraps when it reaches the edge of its container.
 * @remarks
 * [TextBox](../windows.ui.xaml.controls/textbox.md) and [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) don't support the **WrapWholeWords** value for their **TextWrapping** properties. If you try to use **WrapWholeWords** as a value for [TextBox.TextWrapping](../windows.ui.xaml.controls/textbox_textwrapping.md) or [RichEditBox.TextWrapping](../windows.ui.xaml.controls/richeditbox_textwrapping.md) an invalid argument exception is thrown.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.textwrapping
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class TextWrapping extends Win32Enum{

    /**
     * No line wrapping is performed.
     * @type {Integer (Int32)}
     */
    static NoWrap => 1

    /**
     * Line breaking occurs if a line of text overflows beyond the available width of its container. Line breaking occurs even if the text logic can't determine any line break opportunity. For example, if a very long word is constrained in a fixed-width container that can't scroll, it will wrap at a point that might be in the middle of a word.
     * @type {Integer (Int32)}
     */
    static Wrap => 2

    /**
     * Line-breaking occurs if the line overflows beyond the available block width. A line may overflow beyond the block width if the text logic can't determine a line break opportunity. For example, if a very long word is constrained in a fixed-width container that can't scroll, it will overflow the long word and continue the text after the long word on the next line. Not supported by all controls; see Remarks.
     * @type {Integer (Int32)}
     */
    static WrapWholeWords => 3
}
