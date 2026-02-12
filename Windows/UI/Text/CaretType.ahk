#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the caret type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.carettype
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class CaretType extends Win32Enum{

    /**
     * The insertion point for a sequenced language; that is, characters that are typed with one key stroke.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The insertion point is null.
     * @type {Integer (Int32)}
     */
    static Null => 1
}
