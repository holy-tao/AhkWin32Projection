#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies options for retrieving the text in a document or text range.
 * @remarks
 * If both UseLf and UseCrLf are used an invalid argument exception is thrown.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textgetoptions
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class TextGetOptions extends Win32BitflagEnum{

    /**
     * None of the following options is used.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * If the starting character position is in the middle of a construct such as a CRLF (U+000D U+000A), surrogate pair, variation-selector sequence, or table-row delimiter, move to the beginning of the construct.
     * @type {Integer (UInt32)}
     */
    static AdjustCrlf => 1

    /**
     * Use carriage return/line feed (CR/LF) in place of a carriage return.
     * @type {Integer (UInt32)}
     */
    static UseCrlf => 2

    /**
     * Retrieve text including the alternate text for the images in the range.
     * @type {Integer (UInt32)}
     */
    static UseObjectText => 4

    /**
     * Allow retrieving the final end-of-paragraph (EOP) if it’s included in the range. This EOP exists in all rich-text controls and cannot be deleted. It does not exist in plain-text controls.
     * @type {Integer (UInt32)}
     */
    static AllowFinalEop => 8

    /**
     * Don't include hidden text.
     * @type {Integer (UInt32)}
     */
    static NoHidden => 32

    /**
     * Include list numbers.
     * @type {Integer (UInt32)}
     */
    static IncludeNumbering => 64

    /**
     * Retrieve Rich Text Format (RTF) instead of plain text. Rich Text Format (RTF) is a BYTE (8-bit) format, but because [ITextRange.GetText](itextrange_gettext_518428927.md) returns a string, the Rich Text Format (RTF) is returned as WCHARs (16-bit or UTF-16), not bytes, when you call [ITextRange.GetText](itextrange_gettext_518428927.md) with the **FormatRtf** value. When you call [ITextRange.SetText](itextrange_settext_522499431.md) with **FormatRtf**, the method accepts an string containing either bytes or WCHARs, but other Rich Text Format (RTF) readers only understand bytes.
     * @type {Integer (UInt32)}
     */
    static FormatRtf => 8192

    /**
     * Use line feed (LF) in place of all carriage returns.
     * @type {Integer (UInt32)}
     */
    static UseLf => 16777216
}
