#Requires AutoHotkey v2.0.0 64-bit

/**
 * The StringTrimming enumeration specifies how to trim characters from a string so that the string fits into a layout rectangle. The layout rectangle is used to position and size the display string.
 * @remarks
 * 
  * Trimming affects only the last visible or partly visible (due to clipping) line of text.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-stringtrimming
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class StringTrimming{

    /**
     * Specifies that no trimming is done.
     * @type {Integer (Int32)}
     */
    static StringTrimmingNone => 0

    /**
     * Specifies that the string is broken at the boundary of the last character that is inside the layout rectangle. This is the default.
     * @type {Integer (Int32)}
     */
    static StringTrimmingCharacter => 1

    /**
     * Specifies that the string is broken at the boundary of the last word that is inside the layout rectangle.
     * @type {Integer (Int32)}
     */
    static StringTrimmingWord => 2

    /**
     * Specifies that the string is broken at the boundary of the last character that is inside the layout rectangle and an ellipsis (...) is inserted after the character.
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisCharacter => 3

    /**
     * Specifies that the string is broken at the boundary of the last word that is inside the layout rectangle and an ellipsis (...) is inserted after the word.
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisWord => 4

    /**
     * Specifies that the center is removed from the string and replaced by an ellipsis. The algorithm keeps as much of the last portion of the string as possible.
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisPath => 5
}
