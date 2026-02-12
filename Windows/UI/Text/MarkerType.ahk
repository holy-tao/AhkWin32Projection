#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of characters used to mark the item paragraphs in a list.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.markertype
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class MarkerType extends Win32Enum{

    /**
     * The list type is not defined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Not a list paragraph.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * The list uses bullets (character code 0x2022).
     * @type {Integer (Int32)}
     */
    static Bullet => 2

    /**
     * The list is numbered with Arabic numerals (0, 1, 2, ...).
     * @type {Integer (Int32)}
     */
    static Arabic => 3

    /**
     * The list is ordered with lowercase letters (a, b, c, ...).
     * @type {Integer (Int32)}
     */
    static LowercaseEnglishLetter => 4

    /**
     * The list is ordered with uppercase letters (A, B, C, ...).
     * @type {Integer (Int32)}
     */
    static UppercaseEnglishLetter => 5

    /**
     * The list is ordered with lowercase Roman letters (i, ii, iii, ...).
     * @type {Integer (Int32)}
     */
    static LowercaseRoman => 6

    /**
     * The list is ordered with uppercase Roman letters (I, II, III, ...).
     * @type {Integer (Int32)}
     */
    static UppercaseRoman => 7

    /**
     * The value returned by [ITextParagraphFormat.ListStart](itextparagraphformat_liststart.md) is treated as the first code in a Unicode sequence.
     * @type {Integer (Int32)}
     */
    static UnicodeSequence => 8

    /**
     * The list is ordered with Unicode circled numbers <img alt="Unicode numbers in a circle." src="images/unicodecirclednumbers.png" />
     * @type {Integer (Int32)}
     */
    static CircledNumber => 9

    /**
     * The list is ordered with Wingdings black circled digits <img alt="Circled black digits." src="images/wingdingblackcircleddigits.png" />
     * @type {Integer (Int32)}
     */
    static BlackCircleWingding => 10

    /**
     * The list is ordered with Wingdings white circled digits <img alt="White digits in a black circle." src="images/wingdingwhitecircleddigits.png" />
     * @type {Integer (Int32)}
     */
    static WhiteCircleWingding => 11

    /**
     * Full-width ASCII (０, １, ２, ３, …).
     * @type {Integer (Int32)}
     */
    static ArabicWide => 12

    /**
     * Chinese with 十 only in items 10 through 99 (一, 二, 三, 四, …).
     * @type {Integer (Int32)}
     */
    static SimplifiedChinese => 13

    /**
     * Chinese with 十 only in items 10 through 19.
     * @type {Integer (Int32)}
     */
    static TraditionalChinese => 14

    /**
     * Chinese with a full-width period, no 十.
     * @type {Integer (Int32)}
     */
    static JapanSimplifiedChinese => 15

    /**
     * Chinese with no 十.
     * @type {Integer (Int32)}
     */
    static JapanKorea => 16

    /**
     * Arabic alphabetic ( أ ,ب ,ت ,ث ,…).
     * @type {Integer (Int32)}
     */
    static ArabicDictionary => 17

    /**
     * Arabic abjadi ( أ ,ب ,ج ,د ,…).
     * @type {Integer (Int32)}
     */
    static ArabicAbjad => 18

    /**
     * Hebrew alphabet (א, ב, ג, ד, …).
     * @type {Integer (Int32)}
     */
    static Hebrew => 19

    /**
     * Thai alphabetic (ก, ข,ค, ง, …).
     * @type {Integer (Int32)}
     */
    static ThaiAlphabetic => 20

    /**
     * Thai numbers (๑, ๒,๓, ๔, …).
     * @type {Integer (Int32)}
     */
    static ThaiNumeric => 21

    /**
     * Devanāgarī vowels (अ, आ, इ, ई, …).
     * @type {Integer (Int32)}
     */
    static DevanagariVowel => 22

    /**
     * Devanāgarī consonants (क, ख, ग, घ, …).
     * @type {Integer (Int32)}
     */
    static DevanagariConsonant => 23

    /**
     * Devanāgarī numbers (१, २, ३, ४, …).
     * @type {Integer (Int32)}
     */
    static DevanagariNumeric => 24
}
