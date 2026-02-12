#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes how text is trimmed when it overflows the edge of its containing box.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.texttrimming
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class TextTrimming extends Win32Enum{

    /**
     * Default.
     * 
     * Text is truncated at a word boundary. 
     * 
     * No trim indicator is drawn and the [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md)/[TextBlock](../windows.ui.xaml.controls/textblock.md) IsTextTrimmedChanged event does not fire.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Text is trimmed at a character boundary. An ellipsis (...) is drawn in place of remaining text.
     * @type {Integer (Int32)}
     */
    static CharacterEllipsis => 1

    /**
     * Text is trimmed at a word boundary. An ellipsis (...) is drawn in place of remaining text.
     * @type {Integer (Int32)}
     */
    static WordEllipsis => 2

    /**
     * Text is trimmed at a pixel level, visually clipping the excess glyphs.
     * @type {Integer (Int32)}
     */
    static Clip => 3
}
