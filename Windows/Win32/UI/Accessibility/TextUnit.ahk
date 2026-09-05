#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify units of text for the purposes of navigation.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-textunit
 * @namespace Windows.Win32.UI.Accessibility
 */
class TextUnit extends Win32Enum {

    /**
     * Character.
     * Native name: TextUnit_Character
     * @type {Integer (Int32)}
     */
    static Character => 0

    /**
     * Format.
     * Native name: TextUnit_Format
     * @type {Integer (Int32)}
     */
    static Format => 1

    /**
     * Word.
     * Native name: TextUnit_Word
     * @type {Integer (Int32)}
     */
    static Word => 2

    /**
     * Line.
     * Native name: TextUnit_Line
     * @type {Integer (Int32)}
     */
    static Line => 3

    /**
     * Paragraph.
     * Native name: TextUnit_Paragraph
     * @type {Integer (Int32)}
     */
    static Paragraph => 4

    /**
     * Page.
     * Native name: TextUnit_Page
     * @type {Integer (Int32)}
     */
    static Page => 5

    /**
     * Document.
     * Native name: TextUnit_Document
     * @type {Integer (Int32)}
     */
    static Document => 6
}
