#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines glyph characteristic information that an application needs to implement justification.
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ne-usp10-script_justify
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_JUSTIFY extends Win32Enum{

    /**
     * Justification cannot be applied at the glyph.
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_NONE => 0

    /**
     * The glyph represents a blank in an Arabic run.
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_BLANK => 1

    /**
     * An inter-character justification point follows the glyph.
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_CHARACTER => 2

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_RESERVED1 => 3

    /**
     * The glyph represents a blank outside an Arabic run.
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_BLANK => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_RESERVED2 => 5

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_RESERVED3 => 6

    /**
     * Normal middle-of-word glyph that connects to the right (begin).
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_NORMAL => 7

    /**
     * Kashida (U+0640) in the middle of the word.
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_KASHIDA => 8

    /**
     * Final form of an alef-like (U+0627, U+0625, U+0623, U+0622).
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_ALEF => 9

    /**
     * Final form of Ha (U+0647).
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_HA => 10

    /**
     * Final form of Ra (U+0631).
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_RA => 11

    /**
     * Final form of Ba (U+0628).
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_BA => 12

    /**
     * Ligature of alike (U+0628,U+0631).
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_BARA => 13

    /**
     * Highest priority: initial shape of Seen class (U+0633).
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_SEEN => 14

    /**
     * Highest priority: medial shape of Seen class (U+0633).
     * @type {Integer (Int32)}
     */
    static SCRIPT_JUSTIFY_ARABIC_SEEN_M => 15
}
