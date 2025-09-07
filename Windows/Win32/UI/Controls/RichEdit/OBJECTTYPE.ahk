#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that identify object types in the Text Object Model (TOM)  content.
 * @see https://learn.microsoft.com/windows/win32/api/tom/ne-tom-objecttype
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class OBJECTTYPE{

    /**
     * Not an inline function.
     * @type {Integer (Int32)}
     */
    static tomSimpleText => 0

    /**
     * Base text with ruby annotation.
     * @type {Integer (Int32)}
     */
    static tomRuby => 1

    /**
     * Text flows horizontally in a vertically oriented document.
     * @type {Integer (Int32)}
     */
    static tomHorzVert => 2

    /**
     * A Warichu "2 lines in one" comment.
     * @type {Integer (Int32)}
     */
    static tomWarichu => 3

    /**
     * An RTF Eq (equation) field.
     * @type {Integer (Int32)}
     */
    static tomEq => 9

    /**
     * Math.
     * @type {Integer (Int32)}
     */
    static tomMath => 10

    /**
     * Accent (combining mark).
     * @type {Integer (Int32)}
     */
    static tomAccent => 10

    /**
     * Abstract box with properties.
     * @type {Integer (Int32)}
     */
    static tomBox => 11

    /**
     * Encloses the argument in a rectangle.
     * @type {Integer (Int32)}
     */
    static tomBoxedFormula => 12

    /**
     * Encloses the argument in brackets, parentheses, and so on.
     * @type {Integer (Int32)}
     */
    static tomBrackets => 13

    /**
     * Encloses the argument in brackets, parentheses, and so on, and with separators.
     * @type {Integer (Int32)}
     */
    static tomBracketsWithSeps => 14

    /**
     * Column of aligned equations.
     * @type {Integer (Int32)}
     */
    static tomEquationArray => 15

    /**
     * Fraction.
     * @type {Integer (Int32)}
     */
    static tomFraction => 16

    /**
     * Function apply.
     * @type {Integer (Int32)}
     */
    static tomFunctionApply => 17

    /**
     * Left subscript or superscript.
     * @type {Integer (Int32)}
     */
    static tomLeftSubSup => 18

    /**
     * Second argument below the first.
     * @type {Integer (Int32)}
     */
    static tomLowerLimit => 19

    /**
     * Matrix.
     * @type {Integer (Int32)}
     */
    static tomMatrix => 20

    /**
     * General <i>n</i>-ary expression.
     * @type {Integer (Int32)}
     */
    static tomNary => 21

    /**
     * Internal use for no-build operators.
     * @type {Integer (Int32)}
     */
    static tomOpChar => 22

    /**
     * Overscores argument.
     * @type {Integer (Int32)}
     */
    static tomOverbar => 23

    /**
     * Special spacing.
     * @type {Integer (Int32)}
     */
    static tomPhantom => 24

    /**
     * Square root, and so on.
     * @type {Integer (Int32)}
     */
    static tomRadical => 25

    /**
     * Skewed and built-up linear fractions.
     * @type {Integer (Int32)}
     */
    static tomSlashedFraction => 26

    /**
     * "Fraction" with no divide bar.
     * @type {Integer (Int32)}
     */
    static tomStack => 27

    /**
     * Stretch character horizontally over or under argument.
     * @type {Integer (Int32)}
     */
    static tomStretchStack => 28

    /**
     * Subscript.
     * @type {Integer (Int32)}
     */
    static tomSubscript => 29

    /**
     * Subscript and superscript combination.
     * @type {Integer (Int32)}
     */
    static tomSubSup => 30

    /**
     * Superscript.
     * @type {Integer (Int32)}
     */
    static tomSuperscript => 31

    /**
     * Underscores the argument.
     * @type {Integer (Int32)}
     */
    static tomUnderbar => 32

    /**
     * Second argument above the first.
     * @type {Integer (Int32)}
     */
    static tomUpperLimit => 33

    /**
     * The maximum value in the <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-objecttype">OBJECTTYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static tomObjectMax => 33
}
