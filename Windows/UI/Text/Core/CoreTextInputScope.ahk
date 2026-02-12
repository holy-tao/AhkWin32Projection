#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the set of input scope names. Input scope is used by the text input server and input processors to determine the layout of the Soft Input Panel (SIP), and what type of language model to use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextinputscope
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextInputScope extends Win32Enum{

    /**
     * No input scope is applied.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Expected input is a URL.
     * @type {Integer (Int32)}
     */
    static Url => 1

    /**
     * Expected input is characters used in describing a file path.
     * @type {Integer (Int32)}
     */
    static FilePath => 2

    /**
     * Expected input is characters used in describing a file name.
     * @type {Integer (Int32)}
     */
    static FileName => 3

    /**
     * Expected input is the account name portion of an email address.
     * @type {Integer (Int32)}
     */
    static EmailUserName => 4

    /**
     * Expected input is an SMTP form email address (&lt;accountname&gt;@&lt;host&gt;).
     * @type {Integer (Int32)}
     */
    static EmailAddress => 5

    /**
     * Expected input is a log-in name and a domain (&lt;accountname&gt; or &lt;domain&gt;\&lt;accountname&gt;).
     * @type {Integer (Int32)}
     */
    static UserName => 6

    /**
     * Expected input is a person’s full name, including prefix, given name, middle name, surname, and suffix.
     * @type {Integer (Int32)}
     */
    static PersonalFullName => 7

    /**
     * Expected input is the prefix portion of a person’s full name. (For example, "Mr.")
     * @type {Integer (Int32)}
     */
    static PersonalNamePrefix => 8

    /**
     * Expected input is the given (or first) name portion of a person’s full name.
     * @type {Integer (Int32)}
     */
    static PersonalGivenName => 9

    /**
     * Expected input is the middle name portion of a person’s full name.
     * @type {Integer (Int32)}
     */
    static PersonalMiddleName => 10

    /**
     * Expected input is the family (or last) name portion of a person’s full name.
     * @type {Integer (Int32)}
     */
    static PersonalSurname => 11

    /**
     * Expected input is the suffix portion of a person’s full name. (For example, "Jr.")
     * @type {Integer (Int32)}
     */
    static PersonalNameSuffix => 12

    /**
     * Expected input is a full postal address. (For example, "One Microsoft Way, Redmond, WA 98052, U.S.A.")
     * @type {Integer (Int32)}
     */
    static Address => 13

    /**
     * Expected input is the postal code (or zip code) portion a full address. (For example, "98052".)
     * @type {Integer (Int32)}
     */
    static AddressPostalCode => 14

    /**
     * Expected input is the street portion a full address. (For example, "Microsoft Way".)
     * @type {Integer (Int32)}
     */
    static AddressStreet => 15

    /**
     * Expected input is the state or province portion a full address. (For example, "WA".)
     * @type {Integer (Int32)}
     */
    static AddressStateOrProvince => 16

    /**
     * Expected input is the city portion a full address. (For example, "Redmond".)
     * @type {Integer (Int32)}
     */
    static AddressCity => 17

    /**
     * Expected input is the country name portion a full address. (For example, "United States of America".)
     * @type {Integer (Int32)}
     */
    static AddressCountryName => 18

    /**
     * Expected input is the country abbreviation portion a full address. (For example, "U.S.A.")
     * @type {Integer (Int32)}
     */
    static AddressCountryShortName => 19

    /**
     * Expected input is an amount of currency and a currency symbol.
     * @type {Integer (Int32)}
     */
    static CurrencyAmountAndSymbol => 20

    /**
     * Expected input is an amount of currency.
     * @type {Integer (Int32)}
     */
    static CurrencyAmount => 21

    /**
     * Expected input is a calendar date.
     * @type {Integer (Int32)}
     */
    static Date => 22

    /**
     * Expected input is the numeric month portion of a calendar date.
     * @type {Integer (Int32)}
     */
    static DateMonth => 23

    /**
     * Expected input is the numeric day portion of a calendar date.
     * @type {Integer (Int32)}
     */
    static DateDay => 24

    /**
     * Expected input is the year portion of a calendar date.
     * @type {Integer (Int32)}
     */
    static DateYear => 25

    /**
     * Expected input is the alphabetic name of the month from a calendar date.
     * @type {Integer (Int32)}
     */
    static DateMonthName => 26

    /**
     * Expected input is the alphabetic name of the day from a calendar date.
     * @type {Integer (Int32)}
     */
    static DateDayName => 27

    /**
     * Expected input includes the digits 0-9, decimal separators, place separators, and negative sign. The exact characters used for  decimal separators, place separators, and negative sign, depend on the user’s regional settings.
     * @type {Integer (Int32)}
     */
    static Number => 29

    /**
     * Expected input is a single ANSI character, codepage 1252.
     * @type {Integer (Int32)}
     */
    static SingleCharacter => 30

    /**
     * Expected input is a password.
     * @type {Integer (Int32)}
     */
    static Password => 31

    /**
     * Expected input is a full telephone number. (For example, "1(800)555-5555".)
     * @type {Integer (Int32)}
     */
    static TelephoneNumber => 32

    /**
     * Expected input is the country code portion of a full telephone number. (For example, "1".)
     * @type {Integer (Int32)}
     */
    static TelephoneCountryCode => 33

    /**
     * Expected input is the area code portion of a full telephone number. (For example, "(800)".)
     * @type {Integer (Int32)}
     */
    static TelephoneAreaCode => 34

    /**
     * Expected input is the local number portion of a full telephone number. (For example, "555-5555".)
     * @type {Integer (Int32)}
     */
    static TelephoneLocalNumber => 35

    /**
     * Expected input is a time value.
     * @type {Integer (Int32)}
     */
    static Time => 36

    /**
     * Expected input is the hour portion of a time value.
     * @type {Integer (Int32)}
     */
    static TimeHour => 37

    /**
     * Expected input is the minute or second portion of a time value.
     * @type {Integer (Int32)}
     */
    static TimeMinuteOrSecond => 38

    /**
     * Expected input is full-width number characters.
     * @type {Integer (Int32)}
     */
    static NumberFullWidth => 39

    /**
     * Expected input is half-width alphanumeric characters.
     * @type {Integer (Int32)}
     */
    static AlphanumericHalfWidth => 40

    /**
     * Expected input is full-width alphanumeric characters.
     * @type {Integer (Int32)}
     */
    static AlphanumericFullWidth => 41

    /**
     * Expected input is Chinese currency.
     * @type {Integer (Int32)}
     */
    static CurrencyChinese => 42

    /**
     * Expected input is the Bopomofo Mandarin Chinese phonetic transcription system.
     * @type {Integer (Int32)}
     */
    static Bopomofo => 43

    /**
     * Expected input is Hiragana characters.
     * @type {Integer (Int32)}
     */
    static Hiragana => 44

    /**
     * Expected input is Katakana half-width characters.
     * @type {Integer (Int32)}
     */
    static KatakanaHalfWidth => 45

    /**
     * Expected input is Katakana full-width characters.
     * @type {Integer (Int32)}
     */
    static KatakanaFullWidth => 46

    /**
     * Expected input is Hanja characters.
     * @type {Integer (Int32)}
     */
    static Hanja => 47

    /**
     * Expected input is Hangul half-width characters.
     * @type {Integer (Int32)}
     */
    static HangulHalfWidth => 48

    /**
     * Expected input is Hangul full-width characters.
     * @type {Integer (Int32)}
     */
    static HangulFullWidth => 49

    /**
     * Expected input is a search string.
     * @type {Integer (Int32)}
     */
    static Search => 50

    /**
     * Expected input is a mathematical formula.
     * @type {Integer (Int32)}
     */
    static Formula => 51

    /**
     * Expected input is a search string. Use for search boxes where incremental results are displayed as the user types.
     * @type {Integer (Int32)}
     */
    static SearchIncremental => 52

    /**
     * Expected input is Chinese half-width characters.
     * @type {Integer (Int32)}
     */
    static ChineseHalfWidth => 53

    /**
     * Expected input is Chinese full-width characters.
     * @type {Integer (Int32)}
     */
    static ChineseFullWidth => 54

    /**
     * Expected input is native script.
     * @type {Integer (Int32)}
     */
    static NativeScript => 55

    /**
     * Expected input is text; turns on typing intelligence.
     * @type {Integer (Int32)}
     */
    static Text => 57

    /**
     * Expected input is chat strings.
     * @type {Integer (Int32)}
     */
    static Chat => 58

    /**
     * Expected input is a name or a telephone number.
     * @type {Integer (Int32)}
     */
    static NameOrPhoneNumber => 59

    /**
     * Expected input is an email user name (\<accountname>) or full email address (\<accountname>@\<host>).
     * @type {Integer (Int32)}
     */
    static EmailUserNameOrAddress => 60

    /**
     * Expected input is private data. Advises input processors that the text should not be stored nor logged.
     * @type {Integer (Int32)}
     */
    static Private => 61

    /**
     * Expected input is from the device's Maps layout; does not include typing intelligence.
     * @type {Integer (Int32)}
     */
    static Maps => 62

    /**
     * Expected input is a numeric password, or PIN.
     * @type {Integer (Int32)}
     */
    static PasswordNumeric => 63

    /**
     * Expected input is a mathematical formula. Advises input processors to show the number page.
     * @type {Integer (Int32)}
     */
    static FormulaNumber => 67

    /**
     * Expected input does not include emoji. Advises input processors to not display the emoji key.
     * @type {Integer (Int32)}
     */
    static ChatWithoutEmoji => 68

    /**
     * Expected input includes positive whole numbers, constrained to 0-9.
     * @type {Integer (Int32)}
     */
    static Digits => 28

    /**
     * Expected input is an numeric password, or PIN. Typically constrained to 5-6 digits.
     * @type {Integer (Int32)}
     */
    static PinNumeric => 64

    /**
     * Expected input is an alphanumeric password, or PIN. Typically constrained to 5-6 characters.
     * @type {Integer (Int32)}
     */
    static PinAlphanumeric => 65
}
