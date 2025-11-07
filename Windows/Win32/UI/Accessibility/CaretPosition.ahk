#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains possible values for the CaretPosition text attribute, which indicates the location of the caret relative to a line of text in a text range.
 * @remarks
 * 
 * The provider of a text-based control considers the caret to be at some character position in the text. For example, if the caret is at the start of the text, it lies at position 0. If the caret is just after the first character, it lies at position 1, and so on. When text wraps around at the end of a line, typically a space is shown at the end of the line, and a non-space character at the start of the next line. The user might be able to place the caret after the space at the end of the first line, or before the non-space character at the start of the next line. However, both places are considered to be the same character position. The <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">CaretPosition</a> attribute indicates whether the caret is shown at the end or the beginning of a line. If the caret lies at neither of these positions, the <b>CaretPosition</b> attribute is <b>CaretPosition_Unknown</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-caretposition
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class CaretPosition{

    /**
     * The caret is not at the beginning or the end of a line.
     * @type {Integer (Int32)}
     */
    static CaretPosition_Unknown => 0

    /**
     * The caret is at the end of a line.
     * @type {Integer (Int32)}
     */
    static CaretPosition_EndOfLine => 1

    /**
     * The caret is at the beginning of a line.
     * @type {Integer (Int32)}
     */
    static CaretPosition_BeginningOfLine => 2
}
