#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the paragraph style.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.paragraphstyle
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ParagraphStyle extends Win32Enum{

    /**
     * The paragraph style is undefined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * There is no paragraph style.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * The paragraph style is normal.
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * The top level heading.
     * @type {Integer (Int32)}
     */
    static Heading1 => 3

    /**
     * The second level heading.
     * @type {Integer (Int32)}
     */
    static Heading2 => 4

    /**
     * Third level heading.
     * @type {Integer (Int32)}
     */
    static Heading3 => 5

    /**
     * Fourth level heading.
     * @type {Integer (Int32)}
     */
    static Heading4 => 6

    /**
     * Fifth level heading.
     * @type {Integer (Int32)}
     */
    static Heading5 => 7

    /**
     * Sixth level heading.
     * @type {Integer (Int32)}
     */
    static Heading6 => 8

    /**
     * Seventh level heading.
     * @type {Integer (Int32)}
     */
    static Heading7 => 9

    /**
     * Eighth level heading.
     * @type {Integer (Int32)}
     */
    static Heading8 => 10

    /**
     * Ninth level heading.
     * @type {Integer (Int32)}
     */
    static Heading9 => 11
}
