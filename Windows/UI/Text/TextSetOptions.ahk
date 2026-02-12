#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies options for setting the text in a text range.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textsetoptions
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class TextSetOptions extends Win32BitflagEnum{

    /**
     * No text setting option is specified.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Use the Unicode bidirectional algorithm.
     * @type {Integer (UInt32)}
     */
    static UnicodeBidi => 1

    /**
     * Don't include text as part of a hyperlink.
     * @type {Integer (UInt32)}
     */
    static Unlink => 8

    /**
     * Don't insert as hidden text.
     * @type {Integer (UInt32)}
     */
    static Unhide => 16

    /**
     * Obey the current text limit instead of increasing the limit to fit.
     * @type {Integer (UInt32)}
     */
    static CheckTextLimit => 32

    /**
     * Treat input text as Rich Text Format (RTF) (the Rich Text Format (RTF) text will be validated).
     * @type {Integer (UInt32)}
     */
    static FormatRtf => 8192

    /**
     * Apply the Rich Text Format (RTF) default settings for the document. Rich Text Format (RTF) often contains document default properties. These properties are typically ignored when inserting Rich Text Format (RTF) (as distinguished from opening an Rich Text Format (RTF) file).
     * @type {Integer (UInt32)}
     */
    static ApplyRtfDocumentDefaults => 16384
}
