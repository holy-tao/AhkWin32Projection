#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the units to use when navigating a text range.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textrangeunit
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class TextRangeUnit extends Win32Enum{

    /**
     * A single character.
     * @type {Integer (Int32)}
     */
    static Character => 0

    /**
     * A span of alphanumeric characters, an end of paragraph, or punctuation that includes any blanks that follow.
     * @type {Integer (Int32)}
     */
    static Word => 1

    /**
     * A string of text that meets the following criteria:
     * + Ends with a period, question mark, or exclamation mark.
     * + Is followed by one or more ASCII white space characters (9 through 0xd and 0x20), or the Unicode paragraph separator (0x2029). The trailing white space is part of the sentence.
     * + The last sentence in a story does not need to have a period, question mark, or exclamation mark.
     * + Other sentences must follow a sentence end and cannot begin with a period, question mark, or exclamation mark.
     * + The start of a story qualifies as the start of a **Sentence**, even if the string there doesn't qualify as a sentence grammatically.
     * @type {Integer (Int32)}
     */
    static Sentence => 2

    /**
     * A string of text terminated by an end-of-paragraph mark, such as carriage return/line feed (CR/LF), carriage return (CR), vertical tab(VT), line feed (LF), form feed (FF), or the Unicode paragraph separator (0x2029).
     * @type {Integer (Int32)}
     */
    static Paragraph => 3

    /**
     * A single line of text on a display, provided that the display is associated with the range. If no display is associated with a range, **Line** is treated as **Paragraph**. A selection automatically has a display.
     * @type {Integer (Int32)}
     */
    static Line => 4

    /**
     * A story, which is a contiguous range of text in a document. For example, a story can contain one of the various parts of a document, such as the main text of a document, headers and footers, footnotes, or annotations. In a rich edit control, there is only one story per document, although a client can use multiple documents to represent multiple stories.
     * @type {Integer (Int32)}
     */
    static Story => 5

    /**
     * The contents of a screen. Typically, a screen is the amount of content associated with the Page Up or Page Down key.
     * @type {Integer (Int32)}
     */
    static Screen => 6

    /**
     * A section.
     * @type {Integer (Int32)}
     */
    static Section => 7

    /**
     * The characters between the upper-left and lower-right corners of the window.
     * @type {Integer (Int32)}
     */
    static Window => 8

    /**
     * A text run of characters that all have identical character formatting properties.
     * @type {Integer (Int32)}
     */
    static CharacterFormat => 9

    /**
     * A text run of characters that all have identical paragraph formatting properties.
     * @type {Integer (Int32)}
     */
    static ParagraphFormat => 10

    /**
     * An embedded object.
     * @type {Integer (Int32)}
     */
    static Object => 11

    /**
     * A paragraph that is ended by a carriage return (CR) or carriage return/line feed (CR/LF).
     * @type {Integer (Int32)}
     */
    static HardParagraph => 12

    /**
     * A complex-script cluster (occurs, for example, in Indic scripts).
     * @type {Integer (Int32)}
     */
    static Cluster => 13

    /**
     * Bold text.
     * @type {Integer (Int32)}
     */
    static Bold => 14

    /**
     * Italic text.
     * @type {Integer (Int32)}
     */
    static Italic => 15

    /**
     * Underlined text.
     * @type {Integer (Int32)}
     */
    static Underline => 16

    /**
     * Strikethrough text.
     * @type {Integer (Int32)}
     */
    static Strikethrough => 17

    /**
     * Protected text.
     * @type {Integer (Int32)}
     */
    static ProtectedText => 18

    /**
     * Hyperlink text.
     * @type {Integer (Int32)}
     */
    static Link => 19

    /**
     * Text in small caps.
     * @type {Integer (Int32)}
     */
    static SmallCaps => 20

    /**
     * Text in all uppercase.
     * @type {Integer (Int32)}
     */
    static AllCaps => 21

    /**
     * Hidden text.
     * @type {Integer (Int32)}
     */
    static Hidden => 22

    /**
     * Outline text.
     * @type {Integer (Int32)}
     */
    static Outline => 23

    /**
     * Shadow text.
     * @type {Integer (Int32)}
     */
    static Shadow => 24

    /**
     * Imprinted (engraved) text.
     * @type {Integer (Int32)}
     */
    static Imprint => 25

    /**
     * Disabled text.
     * @type {Integer (Int32)}
     */
    static Disabled => 26

    /**
     * Revised text.
     * @type {Integer (Int32)}
     */
    static Revised => 27

    /**
     * Text in the subscript character format.
     * @type {Integer (Int32)}
     */
    static Subscript => 28

    /**
     * Text in the superscript character format.
     * @type {Integer (Int32)}
     */
    static Superscript => 29

    /**
     * Text is in a font-bound font. That is, characters that can't be displayed with the current font were assigned a different font that could display the characters.
     * @type {Integer (Int32)}
     */
    static FontBound => 30

    /**
     * Characters in one or more contiguous, friendly-name hyperlinks. To work with single links that might be adjacent, use the **Link** unit.
     * @type {Integer (Int32)}
     */
    static LinkProtected => 31

    /**
     * ContentLink text.
     * @type {Integer (Int32)}
     */
    static ContentLink => 32
}
