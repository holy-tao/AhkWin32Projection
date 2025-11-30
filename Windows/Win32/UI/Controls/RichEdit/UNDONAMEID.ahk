#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate types of rich edit control actions that can be undone or redone. The EM_GETREDONAME and EM_GETUNDONAME messages use this enumeration type to return a value.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ne-richedit-undonameid
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class UNDONAMEID extends Win32Enum{

    /**
     * The type of undo action is unknown.
     * @type {Integer (Int32)}
     */
    static UID_UNKNOWN => 0

    /**
     * Typing operation.
     * @type {Integer (Int32)}
     */
    static UID_TYPING => 1

    /**
     * Delete operation.
     * @type {Integer (Int32)}
     */
    static UID_DELETE => 2

    /**
     * Drag-and-drop operation.
     * @type {Integer (Int32)}
     */
    static UID_DRAGDROP => 3

    /**
     * Cut operation.
     * @type {Integer (Int32)}
     */
    static UID_CUT => 4

    /**
     * Paste operation.
     * @type {Integer (Int32)}
     */
    static UID_PASTE => 5

    /**
     * Automatic table insertion; for example, typing +---+---+&lt;Enter&gt; to insert a table row.
     * @type {Integer (Int32)}
     */
    static UID_AUTOTABLE => 6
}
