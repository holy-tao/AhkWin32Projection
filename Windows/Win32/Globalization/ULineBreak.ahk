#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class ULineBreak extends Win32Enum {

    /**
     * Native name: U_LB_UNKNOWN
     * @type {Integer (Int32)}
     */
    static LB_UNKNOWN => 0

    /**
     * Native name: U_LB_AMBIGUOUS
     * @type {Integer (Int32)}
     */
    static LB_AMBIGUOUS => 1

    /**
     * Native name: U_LB_ALPHABETIC
     * @type {Integer (Int32)}
     */
    static LB_ALPHABETIC => 2

    /**
     * Native name: U_LB_BREAK_BOTH
     * @type {Integer (Int32)}
     */
    static LB_BREAK_BOTH => 3

    /**
     * Native name: U_LB_BREAK_AFTER
     * @type {Integer (Int32)}
     */
    static LB_BREAK_AFTER => 4

    /**
     * Native name: U_LB_BREAK_BEFORE
     * @type {Integer (Int32)}
     */
    static LB_BREAK_BEFORE => 5

    /**
     * Native name: U_LB_MANDATORY_BREAK
     * @type {Integer (Int32)}
     */
    static LB_MANDATORY_BREAK => 6

    /**
     * Native name: U_LB_CONTINGENT_BREAK
     * @type {Integer (Int32)}
     */
    static LB_CONTINGENT_BREAK => 7

    /**
     * Native name: U_LB_CLOSE_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static LB_CLOSE_PUNCTUATION => 8

    /**
     * Native name: U_LB_COMBINING_MARK
     * @type {Integer (Int32)}
     */
    static LB_COMBINING_MARK => 9

    /**
     * Native name: U_LB_CARRIAGE_RETURN
     * @type {Integer (Int32)}
     */
    static LB_CARRIAGE_RETURN => 10

    /**
     * Native name: U_LB_EXCLAMATION
     * @type {Integer (Int32)}
     */
    static LB_EXCLAMATION => 11

    /**
     * Native name: U_LB_GLUE
     * @type {Integer (Int32)}
     */
    static LB_GLUE => 12

    /**
     * Native name: U_LB_HYPHEN
     * @type {Integer (Int32)}
     */
    static LB_HYPHEN => 13

    /**
     * Native name: U_LB_IDEOGRAPHIC
     * @type {Integer (Int32)}
     */
    static LB_IDEOGRAPHIC => 14

    /**
     * Native name: U_LB_INSEPARABLE
     * @type {Integer (Int32)}
     */
    static LB_INSEPARABLE => 15

    /**
     * Native name: U_LB_INSEPERABLE
     * @type {Integer (Int32)}
     */
    static LB_INSEPERABLE => 15

    /**
     * Native name: U_LB_INFIX_NUMERIC
     * @type {Integer (Int32)}
     */
    static LB_INFIX_NUMERIC => 16

    /**
     * Native name: U_LB_LINE_FEED
     * @type {Integer (Int32)}
     */
    static LB_LINE_FEED => 17

    /**
     * Native name: U_LB_NONSTARTER
     * @type {Integer (Int32)}
     */
    static LB_NONSTARTER => 18

    /**
     * Native name: U_LB_NUMERIC
     * @type {Integer (Int32)}
     */
    static LB_NUMERIC => 19

    /**
     * Native name: U_LB_OPEN_PUNCTUATION
     * @type {Integer (Int32)}
     */
    static LB_OPEN_PUNCTUATION => 20

    /**
     * Native name: U_LB_POSTFIX_NUMERIC
     * @type {Integer (Int32)}
     */
    static LB_POSTFIX_NUMERIC => 21

    /**
     * Native name: U_LB_PREFIX_NUMERIC
     * @type {Integer (Int32)}
     */
    static LB_PREFIX_NUMERIC => 22

    /**
     * Native name: U_LB_QUOTATION
     * @type {Integer (Int32)}
     */
    static LB_QUOTATION => 23

    /**
     * Native name: U_LB_COMPLEX_CONTEXT
     * @type {Integer (Int32)}
     */
    static LB_COMPLEX_CONTEXT => 24

    /**
     * Native name: U_LB_SURROGATE
     * @type {Integer (Int32)}
     */
    static LB_SURROGATE => 25

    /**
     * Native name: U_LB_SPACE
     * @type {Integer (Int32)}
     */
    static LB_SPACE => 26

    /**
     * Native name: U_LB_BREAK_SYMBOLS
     * @type {Integer (Int32)}
     */
    static LB_BREAK_SYMBOLS => 27

    /**
     * Native name: U_LB_ZWSPACE
     * @type {Integer (Int32)}
     */
    static LB_ZWSPACE => 28

    /**
     * Native name: U_LB_NEXT_LINE
     * @type {Integer (Int32)}
     */
    static LB_NEXT_LINE => 29

    /**
     * Native name: U_LB_WORD_JOINER
     * @type {Integer (Int32)}
     */
    static LB_WORD_JOINER => 30

    /**
     * Native name: U_LB_H2
     * @type {Integer (Int32)}
     */
    static LB_H2 => 31

    /**
     * Native name: U_LB_H3
     * @type {Integer (Int32)}
     */
    static LB_H3 => 32

    /**
     * Native name: U_LB_JL
     * @type {Integer (Int32)}
     */
    static LB_JL => 33

    /**
     * Native name: U_LB_JT
     * @type {Integer (Int32)}
     */
    static LB_JT => 34

    /**
     * Native name: U_LB_JV
     * @type {Integer (Int32)}
     */
    static LB_JV => 35

    /**
     * Native name: U_LB_CLOSE_PARENTHESIS
     * @type {Integer (Int32)}
     */
    static LB_CLOSE_PARENTHESIS => 36

    /**
     * Native name: U_LB_CONDITIONAL_JAPANESE_STARTER
     * @type {Integer (Int32)}
     */
    static LB_CONDITIONAL_JAPANESE_STARTER => 37

    /**
     * Native name: U_LB_HEBREW_LETTER
     * @type {Integer (Int32)}
     */
    static LB_HEBREW_LETTER => 38

    /**
     * Native name: U_LB_REGIONAL_INDICATOR
     * @type {Integer (Int32)}
     */
    static LB_REGIONAL_INDICATOR => 39

    /**
     * Native name: U_LB_E_BASE
     * @type {Integer (Int32)}
     */
    static LB_E_BASE => 40

    /**
     * Native name: U_LB_E_MODIFIER
     * @type {Integer (Int32)}
     */
    static LB_E_MODIFIER => 41

    /**
     * Native name: U_LB_ZWJ
     * @type {Integer (Int32)}
     */
    static LB_ZWJ => 42
}
