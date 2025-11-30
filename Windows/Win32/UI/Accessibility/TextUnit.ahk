#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify units of text for the purposes of navigation.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-textunit
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class TextUnit extends Win32Enum{

    /**
     * Character.
     * @type {Integer (Int32)}
     */
    static TextUnit_Character => 0

    /**
     * Format.
     * @type {Integer (Int32)}
     */
    static TextUnit_Format => 1

    /**
     * Word.
     * @type {Integer (Int32)}
     */
    static TextUnit_Word => 2

    /**
     * Line.
     * @type {Integer (Int32)}
     */
    static TextUnit_Line => 3

    /**
     * Paragraph.
     * @type {Integer (Int32)}
     */
    static TextUnit_Paragraph => 4

    /**
     * Page.
     * @type {Integer (Int32)}
     */
    static TextUnit_Page => 5

    /**
     * Document.
     * @type {Integer (Int32)}
     */
    static TextUnit_Document => 6
}
