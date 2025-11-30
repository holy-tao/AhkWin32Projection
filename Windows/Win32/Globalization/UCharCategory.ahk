#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCharCategory extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_UNASSIGNED => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_GENERAL_OTHER_TYPES => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_UPPERCASE_LETTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_LOWERCASE_LETTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_TITLECASE_LETTER => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_MODIFIER_LETTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_OTHER_LETTER => 5

    /**
     * @type {Integer (Int32)}
     */
    static U_NON_SPACING_MARK => 6

    /**
     * @type {Integer (Int32)}
     */
    static U_ENCLOSING_MARK => 7

    /**
     * @type {Integer (Int32)}
     */
    static U_COMBINING_SPACING_MARK => 8

    /**
     * @type {Integer (Int32)}
     */
    static U_DECIMAL_DIGIT_NUMBER => 9

    /**
     * @type {Integer (Int32)}
     */
    static U_LETTER_NUMBER => 10

    /**
     * @type {Integer (Int32)}
     */
    static U_OTHER_NUMBER => 11

    /**
     * @type {Integer (Int32)}
     */
    static U_SPACE_SEPARATOR => 12

    /**
     * @type {Integer (Int32)}
     */
    static U_LINE_SEPARATOR => 13

    /**
     * @type {Integer (Int32)}
     */
    static U_PARAGRAPH_SEPARATOR => 14

    /**
     * @type {Integer (Int32)}
     */
    static U_CONTROL_CHAR => 15

    /**
     * @type {Integer (Int32)}
     */
    static U_FORMAT_CHAR => 16

    /**
     * @type {Integer (Int32)}
     */
    static U_PRIVATE_USE_CHAR => 17

    /**
     * @type {Integer (Int32)}
     */
    static U_SURROGATE => 18

    /**
     * @type {Integer (Int32)}
     */
    static U_DASH_PUNCTUATION => 19

    /**
     * @type {Integer (Int32)}
     */
    static U_START_PUNCTUATION => 20

    /**
     * @type {Integer (Int32)}
     */
    static U_END_PUNCTUATION => 21

    /**
     * @type {Integer (Int32)}
     */
    static U_CONNECTOR_PUNCTUATION => 22

    /**
     * @type {Integer (Int32)}
     */
    static U_OTHER_PUNCTUATION => 23

    /**
     * @type {Integer (Int32)}
     */
    static U_MATH_SYMBOL => 24

    /**
     * @type {Integer (Int32)}
     */
    static U_CURRENCY_SYMBOL => 25

    /**
     * @type {Integer (Int32)}
     */
    static U_MODIFIER_SYMBOL => 26

    /**
     * @type {Integer (Int32)}
     */
    static U_OTHER_SYMBOL => 27

    /**
     * @type {Integer (Int32)}
     */
    static U_INITIAL_PUNCTUATION => 28

    /**
     * @type {Integer (Int32)}
     */
    static U_FINAL_PUNCTUATION => 29

    /**
     * @type {Integer (Int32)}
     */
    static U_CHAR_CATEGORY_COUNT => 30
}
