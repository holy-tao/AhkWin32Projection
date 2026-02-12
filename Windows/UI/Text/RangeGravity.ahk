#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the gravity for a text range.
 * @remarks
 * The gravity of a text range determines which text run’s formatting is used by the [ITextCharacterFormat](itextcharacterformat.md) and [ITextParagraphFormat](itextparagraphformat.md) interfaces when the range is an insertion point between two runs.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.rangegravity
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class RangeGravity extends Win32Enum{

    /**
     * Use selection user interface rules.
     * @type {Integer (Int32)}
     */
    static UIBehavior => 0

    /**
     * Use the formatting of the previous text run when on a boundary between runs.
     * @type {Integer (Int32)}
     */
    static Backward => 1

    /**
     * Use the formatting of the following text run when on a boundary between runs.
     * @type {Integer (Int32)}
     */
    static Forward => 2

    /**
     * The start of the text range has forward gravity, and the end has backward gravity.
     * @type {Integer (Int32)}
     */
    static Inward => 3

    /**
     * The start of the text range has backward gravity, and the end has forward gravity.
     * @type {Integer (Int32)}
     */
    static Outward => 4
}
