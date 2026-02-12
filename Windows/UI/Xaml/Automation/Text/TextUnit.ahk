#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents predefined units of text for the purposes of navigation within a document.
 * @remarks
 * TextUnit defines an input for the [Move](../windows.ui.text/itextrange_move_1126378751.md) method and related methods of the **TextRange** automation control pattern. [ITextRangeProvider](../windows.ui.xaml.automation.provider/itextrangeprovider.md) is the definition interface if you want to support the **TextRange** automation pattern as part of a Windows Runtime custom control. For more info, see [ITextRangeProvider](../windows.ui.xaml.automation.provider/itextrangeprovider.md) or [Text and TextRange Control Patterns](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.text.textunit
 * @namespace Windows.UI.Xaml.Automation.Text
 * @version WindowsRuntime 1.4
 */
class TextUnit extends Win32Enum{

    /**
     * Specifies that the text unit is one character in length.
     * @type {Integer (Int32)}
     */
    static Character => 0

    /**
     * Specifies that the text unit is the length of a single, common format specification, such as bold, italic, or similar.
     * @type {Integer (Int32)}
     */
    static Format => 1

    /**
     * Specifies that the text unit is one word in length.
     * @type {Integer (Int32)}
     */
    static Word => 2

    /**
     * Specifies that the text unit is one line in length.
     * @type {Integer (Int32)}
     */
    static Line => 3

    /**
     * Specifies that the text unit is one paragraph in length.
     * @type {Integer (Int32)}
     */
    static Paragraph => 4

    /**
     * Specifies that the text unit is one document-specific page in length.
     * @type {Integer (Int32)}
     */
    static Page => 5

    /**
     * Specifies that the text unit is an entire document in length.
     * @type {Integer (Int32)}
     */
    static Document => 6
}
