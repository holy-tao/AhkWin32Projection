#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines glyph characteristic information that an application needs to implement justification.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ne-usp10-script_justify
 * @namespace Windows.Win32.Globalization
 */
class SCRIPT_JUSTIFY extends Win32Enum {

    /**
     * Justification cannot be applied at the glyph.
     * Native name: SCRIPT_JUSTIFY_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The glyph represents a blank in an Arabic run.
     * Native name: SCRIPT_JUSTIFY_ARABIC_BLANK
     * @type {Integer (Int32)}
     */
    static ARABIC_BLANK => 1

    /**
     * An inter-character justification point follows the glyph.
     * Native name: SCRIPT_JUSTIFY_CHARACTER
     * @type {Integer (Int32)}
     */
    static CHARACTER => 2

    /**
     * Reserved.
     * Native name: SCRIPT_JUSTIFY_RESERVED1
     * @type {Integer (Int32)}
     */
    static RESERVED1 => 3

    /**
     * The glyph represents a blank outside an Arabic run.
     * Native name: SCRIPT_JUSTIFY_BLANK
     * @type {Integer (Int32)}
     */
    static BLANK => 4

    /**
     * Reserved.
     * Native name: SCRIPT_JUSTIFY_RESERVED2
     * @type {Integer (Int32)}
     */
    static RESERVED2 => 5

    /**
     * Reserved.
     * Native name: SCRIPT_JUSTIFY_RESERVED3
     * @type {Integer (Int32)}
     */
    static RESERVED3 => 6

    /**
     * Normal middle-of-word glyph that connects to the right (begin).
     * Native name: SCRIPT_JUSTIFY_ARABIC_NORMAL
     * @type {Integer (Int32)}
     */
    static ARABIC_NORMAL => 7

    /**
     * Kashida (U+0640) in the middle of the word.
     * Native name: SCRIPT_JUSTIFY_ARABIC_KASHIDA
     * @type {Integer (Int32)}
     */
    static ARABIC_KASHIDA => 8

    /**
     * Final form of an alef-like (U+0627, U+0625, U+0623, U+0622).
     * Native name: SCRIPT_JUSTIFY_ARABIC_ALEF
     * @type {Integer (Int32)}
     */
    static ARABIC_ALEF => 9

    /**
     * Final form of Ha (U+0647).
     * Native name: SCRIPT_JUSTIFY_ARABIC_HA
     * @type {Integer (Int32)}
     */
    static ARABIC_HA => 10

    /**
     * Final form of Ra (U+0631).
     * Native name: SCRIPT_JUSTIFY_ARABIC_RA
     * @type {Integer (Int32)}
     */
    static ARABIC_RA => 11

    /**
     * Final form of Ba (U+0628).
     * Native name: SCRIPT_JUSTIFY_ARABIC_BA
     * @type {Integer (Int32)}
     */
    static ARABIC_BA => 12

    /**
     * Ligature of alike (U+0628,U+0631).
     * Native name: SCRIPT_JUSTIFY_ARABIC_BARA
     * @type {Integer (Int32)}
     */
    static ARABIC_BARA => 13

    /**
     * Highest priority: initial shape of Seen class (U+0633).
     * Native name: SCRIPT_JUSTIFY_ARABIC_SEEN
     * @type {Integer (Int32)}
     */
    static ARABIC_SEEN => 14

    /**
     * Highest priority: medial shape of Seen class (U+0633).
     * Native name: SCRIPT_JUSTIFY_ARABIC_SEEN_M
     * @type {Integer (Int32)}
     */
    static ARABIC_SEEN_M => 15
}
