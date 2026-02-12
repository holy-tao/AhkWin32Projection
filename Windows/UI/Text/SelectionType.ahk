#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a selection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.selectiontype
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class SelectionType extends Win32Enum{

    /**
     * No selection and no insertion point.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * An insertion point.
     * @type {Integer (Int32)}
     */
    static InsertionPoint => 1

    /**
     * A single nondegenerate range.
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * An image (see [ITextRange.InsertImage](itextrange_insertimage_631868789.md)).
     * @type {Integer (Int32)}
     */
    static InlineShape => 7

    /**
     * A shape.
     * @type {Integer (Int32)}
     */
    static Shape => 8
}
