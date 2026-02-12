#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the Unicode general category of a character.
 * @remarks
 * A member of this enumeration is returned by [GetGeneralCategory](unicodecharacters_getgeneralcategory_1785789586.md). A Unicode general category defines the broad classification of a character— that is, designation as a type of letter, decimal digit, separator, mathematical symbol, punctuation, and so on. See the [Unicode Standard Annex #44](https://www.unicode.org/reports/tr44/#General_Category_Values).
 * 
 * The values of this enumeration are compatible with the Microsoft .NET  [System.Globalization.UnicodeGeneralCategory](/dotnet/api/system.globalization.unicodecategory?view=dotnet-uwp-10.0&preserve-view=true) enumeration.
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.unicodegeneralcategory
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class UnicodeGeneralCategory extends Win32Enum{

    /**
     * Uppercase letter. Signified by the Unicode designation "Lu" (letter, uppercase).
     * @type {Integer (Int32)}
     */
    static UppercaseLetter => 0

    /**
     * Lowercase letter. Signified by the Unicode designation "Ll" (letter, lowercase).
     * @type {Integer (Int32)}
     */
    static LowercaseLetter => 1

    /**
     * Titlecase letter. Signified by the Unicode designation "Lt" (letter, titlecase).
     * @type {Integer (Int32)}
     */
    static TitlecaseLetter => 2

    /**
     * Modifier letter character, which is a free-standing spacing character that indicates modifications of a preceding letter. Signified by the Unicode designation "Lm" (letter, modifier).
     * @type {Integer (Int32)}
     */
    static ModifierLetter => 3

    /**
     * Letter that is not an uppercase letter, a lowercase letter, a titlecase letter, or a modifier letter. Signified by the Unicode designation "Lo" (letter, other).
     * @type {Integer (Int32)}
     */
    static OtherLetter => 4

    /**
     * Nonspacing character that indicates modifications of a base character. Signified by the Unicode designation "Mn" (mark, nonspacing),
     * @type {Integer (Int32)}
     */
    static NonspacingMark => 5

    /**
     * Spacing character that indicates modifications of a base character and affects the width of the glyph for that base character. Signified by the Unicode designation "Mc" (mark, spacing combining).
     * @type {Integer (Int32)}
     */
    static SpacingCombiningMark => 6

    /**
     * Enclosing mark character, which is a nonspacing combining character that surrounds all previous characters up to and including a base character. Signified by the Unicode designation "Me" (mark, enclosing).
     * @type {Integer (Int32)}
     */
    static EnclosingMark => 7

    /**
     * Decimal digit character, which is a character in the range 0 through 9. Signified by the Unicode designation "Nd" (number, decimal digit).
     * @type {Integer (Int32)}
     */
    static DecimalDigitNumber => 8

    /**
     * Number represented by a letter, instead of a decimal digit. For example, the Roman numeral for five, which is "V". The indicator is signified by the Unicode designation "Nl" (number, letter).
     * @type {Integer (Int32)}
     */
    static LetterNumber => 9

    /**
     * Number that is neither a decimal digit nor a letter number. For example, the fraction 1/2. The indicator is signified by the Unicode designation "No" (number, other).
     * @type {Integer (Int32)}
     */
    static OtherNumber => 10

    /**
     * Space character, which has no glyph but is not a control or format character. Signified by the Unicode designation "Zs" (separator, space).
     * @type {Integer (Int32)}
     */
    static SpaceSeparator => 11

    /**
     * Character that is used to separate lines of text. Signified by the Unicode designation "Zl" (separator, line).
     * @type {Integer (Int32)}
     */
    static LineSeparator => 12

    /**
     * Character that is used to separate paragraphs. Signified by the Unicode designation "Zp" (separator, paragraph).
     * @type {Integer (Int32)}
     */
    static ParagraphSeparator => 13

    /**
     * Control code character, with a Unicode value of U+007F or in the range U+0000 through U+001F or U+0080 through U+009F. Signified by the Unicode designation "Cc" (other, control).
     * @type {Integer (Int32)}
     */
    static Control => 14

    /**
     * Format character that affects the layout of text or the operation of text processes, but is not normally rendered. Signified by the Unicode designation "Cf" (other, format).
     * @type {Integer (Int32)}
     */
    static Format => 15

    /**
     * High surrogate or low surrogate character. Surrogate code values are in the range U+D800 through U+DFFF. Signified by the Unicode designation "Cs" (other, surrogate).
     * @type {Integer (Int32)}
     */
    static Surrogate => 16

    /**
     * Private-use character, with a Unicode value in the range U+E000 through U+F8FF. Signified by the Unicode designation "Co" (other, private use).
     * @type {Integer (Int32)}
     */
    static PrivateUse => 17

    /**
     * Connector punctuation character that connects two characters. Signified by the Unicode designation "Pc" (punctuation, connector).
     * @type {Integer (Int32)}
     */
    static ConnectorPunctuation => 18

    /**
     * Dash or hyphen character. Signified by the Unicode designation "Pd" (punctuation, dash).
     * @type {Integer (Int32)}
     */
    static DashPunctuation => 19

    /**
     * Opening character of one of the paired punctuation marks, such as parentheses, square brackets, and braces. Signified by the Unicode designation "Ps" (punctuation, open).
     * @type {Integer (Int32)}
     */
    static OpenPunctuation => 20

    /**
     * Closing character of one of the paired punctuation marks, such as parentheses, square brackets, and braces. Signified by the Unicode designation "Pe" (punctuation, close).
     * @type {Integer (Int32)}
     */
    static ClosePunctuation => 21

    /**
     * Opening or initial quotation mark character. Signified by the Unicode designation "Pi" (punctuation, initial quote).
     * @type {Integer (Int32)}
     */
    static InitialQuotePunctuation => 22

    /**
     * Closing or final quotation mark character. Signified by the Unicode designation "Pf" (punctuation, final quote).
     * @type {Integer (Int32)}
     */
    static FinalQuotePunctuation => 23

    /**
     * Punctuation character that is not a connector, a dash, open punctuation, close punctuation, an initial quote, or a final quote. Signified by the Unicode designation "Po" (punctuation, other).
     * @type {Integer (Int32)}
     */
    static OtherPunctuation => 24

    /**
     * Mathematical symbol character, such as "+" or "=". Signified by the Unicode designation "Sm" (symbol, math).
     * @type {Integer (Int32)}
     */
    static MathSymbol => 25

    /**
     * Currency symbol character. Signified by the Unicode designation "Sc" (symbol, currency).
     * @type {Integer (Int32)}
     */
    static CurrencySymbol => 26

    /**
     * Modifier symbol character, which indicates modifications of surrounding characters. For example, the fraction slash indicates that the number to the left is the numerator and the number to the right is the denominator. The indicator is signified by the Unicode designation "Sk" (symbol, modifier).
     * @type {Integer (Int32)}
     */
    static ModifierSymbol => 27

    /**
     * Symbol character that is not a mathematical symbol, a currency symbol or a modifier symbol. Signified by the Unicode designation "So" (symbol, other).
     * @type {Integer (Int32)}
     */
    static OtherSymbol => 28

    /**
     * Character that is not assigned to any Unicode category. Signified by the Unicode code designation "Cn" (other, not assigned).
     * @type {Integer (Int32)}
     */
    static NotAssigned => 29
}
