#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the type of numeral when a Unicode character represents a number.
 * @remarks
 * A member of this enumeration is returned by [GetNumericType](unicodecharacters_getnumerictype_1735068207.md).
 * 
 * These values follow the types in the [Unicode Standard Annex #44](https://www.unicode.org/reports/tr44/#Numeric_Type).
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodenumerictype
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class UnicodeNumericType extends Win32Enum{

    /**
     * Not a numeric character.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A decimal digit in a decimal system that uses 0 through 9.
     * @type {Integer (Int32)}
     */
    static Decimal => 1

    /**
     * A digit in the range 0 through 9 that is used in special contexts.
     * @type {Integer (Int32)}
     */
    static Digit => 2

    /**
     * A character that represents another type of numeric value, such as a fraction.
     * @type {Integer (Int32)}
     */
    static Numeric => 3
}
