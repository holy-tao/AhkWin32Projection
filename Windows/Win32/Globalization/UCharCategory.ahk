#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UCharCategory extends Win32Enum {

    /**
     * Native name: U_UNASSIGNED
     * @type {Integer (Int32)}
     */
    static UNASSIGNED => 0

    /**
     * Native name: U_GENERAL_OTHER_TYPES
     * @type {Integer (Int32)}
     */
    static GENERAL_OTHER_TYPES => 0

    /**
     * Native name: U_UPPERCASE_LETTER
     * @type {Integer (Int32)}
     */
    static UPPERCASE_LETTER => 1

    /**
     * Native name: U_LOWERCASE_LETTER
     * @type {Integer (Int32)}
     */
    static LOWERCASE_LETTER => 2

    /**
     * Native name: U_TITLECASE_LETTER
     * @type {Integer (Int32)}
     */
    static TITLECASE_LETTER => 3

    /**
     * Native name: U_MODIFIER_LETTER
     * @type {Integer (Int32)}
     */
    static MODIFIER_LETTER => 4

    /**
     * Native name: U_OTHER_LETTER
     * @type {Integer (Int32)}
     */
    static OTHER_LETTER => 5

    /**
     * Native name: U_NON_SPACING_MARK
     * @type {Integer (Int32)}
     */
    static NON_SPACING_MARK => 6

    /**
     * Native name: U_ENCLOSING_MARK
     * @type {Integer (Int32)}
     */
    static ENCLOSING_MARK => 7

    /**
     * Native name: U_COMBINING_SPACING_MARK
     * @type {Integer (Int32)}
     */
    static COMBINING_SPACING_MARK => 8

    /**
     * Native name: U_DECIMAL_DIGIT_NUMBER
     * @type {Integer (Int32)}
     */
    static DECIMAL_DIGIT_NUMBER => 9

    /**
     * Native name: U_LETTER_NUMBER
     * @type {Integer (Int32)}
     */
    static LETTER_NUMBER => 10

    /**
     * Native name: U_OTHER_NUMBER
     * @type {Integer (Int32)}
     */
    static OTHER_NUMBER => 11

    /**
     * Native name: U_SPACE_SEPARATOR
     * @type {Integer (Int32)}
     */
    static SPACE_SEPARATOR => 12

    /**
     * Native name: U_LINE_SEPARATOR
     * @type {Integer (Int32)}
     */
    static LINE_SEPARATOR => 13

    /**
     * Native name: U_PARAGRAPH_SEPARATOR
     * @type {Integer (Int32)}
     */
    static PARAGRAPH_SEPARATOR => 14

    /**
     * Native name: U_CONTROL_CHAR
     * @type {Integer (Int32)}
     */
    static CONTROL_CHAR => 15

    /**
     * Native name: U_FORMAT_CHAR
     * @type {Integer (Int32)}
     */
    static FORMAT_CHAR => 16

    /**
     * Native name: U_PRIVATE_USE_CHAR
     * @type {Integer (Int32)}
     */
    static PRIVATE_USE_CHAR => 17

    /**
     * Native name: U_SURROGATE
     * @type {Integer (Int32)}
     */
    static SURROGATE => 18

    /**
     * Native name: U_DASH_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static DASH_PUNCTUATION => 19

    /**
     * Native name: U_START_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static START_PUNCTUATION => 20

    /**
     * Native name: U_END_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static END_PUNCTUATION => 21

    /**
     * Native name: U_CONNECTOR_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static CONNECTOR_PUNCTUATION => 22

    /**
     * Native name: U_OTHER_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static OTHER_PUNCTUATION => 23

    /**
     * Native name: U_MATH_SYMBOL
     * @type {Integer (Int32)}
     */
    static MATH_SYMBOL => 24

    /**
     * Native name: U_CURRENCY_SYMBOL
     * @type {Integer (Int32)}
     */
    static CURRENCY_SYMBOL => 25

    /**
     * Native name: U_MODIFIER_SYMBOL
     * @type {Integer (Int32)}
     */
    static MODIFIER_SYMBOL => 26

    /**
     * Native name: U_OTHER_SYMBOL
     * @type {Integer (Int32)}
     */
    static OTHER_SYMBOL => 27

    /**
     * Native name: U_INITIAL_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static INITIAL_PUNCTUATION => 28

    /**
     * Native name: U_FINAL_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static FINAL_PUNCTUATION => 29

    /**
     * Native name: U_CHAR_CATEGORY_COUNT
     * @type {Integer (Int32)}
     */
    static COUNT => 30
}
