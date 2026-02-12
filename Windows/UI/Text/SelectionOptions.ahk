#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the options that apply to a selection.
 * @remarks
 * Each option is binary, so if a particular option is not set, the text selection has the opposite option. For example, if the Overtype option is not set, the text selection is set to insert mode.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.selectionoptions
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class SelectionOptions extends Win32BitflagEnum{

    /**
     * The start position of the selection is the active end; that is, the end that is changed by pressing Shift+Right Arrow and Shift+Left Arrow.
     * @type {Integer (UInt32)}
     */
    static StartActive => 1

    /**
     * For a degenerate selection (insertion point), the character position at the beginning of a line is the same as the character position at the end of the preceding line. As such, the character position is ambiguous. If this flag is 1, display the caret at the end of the preceding line; otherwise, display it at the beginning of the line.
     * @type {Integer (UInt32)}
     */
    static AtEndOfLine => 2

    /**
     * Insert/overtype mode is set to overtype.
     * @type {Integer (UInt32)}
     */
    static Overtype => 4

    /**
     * The selection is active; that is, the text control has the input focus.
     * @type {Integer (UInt32)}
     */
    static Active => 8

    /**
     * Typing and pasting replaces the selection.
     * @type {Integer (UInt32)}
     */
    static Replace => 16
}
