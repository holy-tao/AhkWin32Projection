#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a particular named input mode ([InputScopeName](inputscopename.md)) used to populate an [InputScope](inputscope.md).
 * @remarks
 * > [!NOTE]
 * > Support for a given input scope value can vary across input methods.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inputscopenamevalue
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class InputScopeNameValue extends Win32Enum{

    /**
     * No input scope is applied.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Indicates a Uniform Resource Identifier (URI). This can include URL, File, or File Transfer Protocol (FTP) formats.
     * 
     * Keyboard includes .com and Go keys (as well as :, -, and / keys). Pressing and holding the .com key displays additional options (.org, .net, and region-specific suffixes).
     * @type {Integer (Int32)}
     */
    static Url => 1

    /**
     * Input scope is intended for working with a Simple Mail Transport Protocol (SMTP) form e-mail address (accountname@host).
     * 
     * Keyboard includes @ and .com keys. Pressing and holding the .com key displays additional options (.org, .net, and region-specific suffixes).
     * 
     * See [EmailNameOrAddress](#-field-emailnameoraddress60) for less specific keyboard.
     * @type {Integer (Int32)}
     */
    static EmailSmtpAddress => 5

    /**
     * Input scope is intended for working with a complete personal name.
     * @type {Integer (Int32)}
     */
    static PersonalFullName => 7

    /**
     * Input scope is intended for working with amount and symbol of currency.
     * @type {Integer (Int32)}
     */
    static CurrencyAmountAndSymbol => 20

    /**
     * Input scope is intended for working with a currency amount (no currency symbol).
     * @type {Integer (Int32)}
     */
    static CurrencyAmount => 21

    /**
     * Input scope is intended for working with a numeric month of the year.
     * @type {Integer (Int32)}
     */
    static DateMonthNumber => 23

    /**
     * Input scope is intended for working with a numeric day of the month.
     * @type {Integer (Int32)}
     */
    static DateDayNumber => 24

    /**
     * Input scope is intended for working with a numeric year.
     * @type {Integer (Int32)}
     */
    static DateYear => 25

    /**
     * Input scope is intended for working with a collection of numbers.
     * @type {Integer (Int32)}
     */
    static Digits => 28

    /**
     * Input scope is intended for working with digits 0-9.
     * @type {Integer (Int32)}
     */
    static Number => 29

    /**
     * Input scope is intended for working with an alphanumeric password, including other symbols, such as punctuation and mathematical symbols.
     * @type {Integer (Int32)}
     */
    static Password => 31

    /**
     * Input scope is intended for working with telephone numbers.
     * @type {Integer (Int32)}
     */
    static TelephoneNumber => 32

    /**
     * Input scope is intended for working with a numeric telephone country/region code.
     * @type {Integer (Int32)}
     */
    static TelephoneCountryCode => 33

    /**
     * Input scope is intended for working with a numeric telephone area code.
     * @type {Integer (Int32)}
     */
    static TelephoneAreaCode => 34

    /**
     * Input scope is intended for working with a local telephone number.
     * @type {Integer (Int32)}
     */
    static TelephoneLocalNumber => 35

    /**
     * Input scope is intended for working with a numeric hour of the day.
     * @type {Integer (Int32)}
     */
    static TimeHour => 37

    /**
     * Input scope is intended for working with a numeric minute of the hour, or second of the minute.
     * @type {Integer (Int32)}
     */
    static TimeMinutesOrSeconds => 38

    /**
     * Input scope is intended for full-width number characters.
     * @type {Integer (Int32)}
     */
    static NumberFullWidth => 39

    /**
     * Input scope is intended for alphanumeric half-width characters.
     * @type {Integer (Int32)}
     */
    static AlphanumericHalfWidth => 40

    /**
     * Input scope is intended for alphanumeric full-width characters.
     * @type {Integer (Int32)}
     */
    static AlphanumericFullWidth => 41

    /**
     * Input scope is intended for Hiragana characters.
     * @type {Integer (Int32)}
     */
    static Hiragana => 44

    /**
     * Input scope is intended for Katakana half-width characters.
     * @type {Integer (Int32)}
     */
    static KatakanaHalfWidth => 45

    /**
     * Input scope is intended for Katakana full-width characters.
     * @type {Integer (Int32)}
     */
    static KatakanaFullWidth => 46

    /**
     * Input scope is intended for Hanja characters.
     * @type {Integer (Int32)}
     */
    static Hanja => 47

    /**
     * Input scope is intended for Hangul half-width characters.
     * @type {Integer (Int32)}
     */
    static HangulHalfWidth => 48

    /**
     * Input scope is intended for Hangul full-width characters.
     * @type {Integer (Int32)}
     */
    static HangulFullWidth => 49

    /**
     * Input scope is intended for search strings.
     * @type {Integer (Int32)}
     */
    static Search => 50

    /**
     * Input scope is intended for spreadsheet formula strings.
     * @type {Integer (Int32)}
     */
    static Formula => 51

    /**
     * Input scope is intended for search boxes where incremental results are displayed as the user types.
     * @type {Integer (Int32)}
     */
    static SearchIncremental => 52

    /**
     * Input scope is intended for Chinese half-width characters.
     * @type {Integer (Int32)}
     */
    static ChineseHalfWidth => 53

    /**
     * Input scope is intended for Chinese full-width characters.
     * @type {Integer (Int32)}
     */
    static ChineseFullWidth => 54

    /**
     * Input scope is intended for native script.
     * @type {Integer (Int32)}
     */
    static NativeScript => 55

    /**
     * Input scope is intended for working with text.
     * @type {Integer (Int32)}
     */
    static Text => 57

    /**
     * Input scope is intended for chat strings.
     * @type {Integer (Int32)}
     */
    static Chat => 58

    /**
     * Input scope is intended for working with a name or telephone number.
     * @type {Integer (Int32)}
     */
    static NameOrPhoneNumber => 59

    /**
     * Input scope is intended for working with an email, name, or address.
     * 
     * See [EmailSmtpAddress](#-field-emailsmtpaddress5) for email-specific keyboard.
     * @type {Integer (Int32)}
     */
    static EmailNameOrAddress => 60

    /**
     * Expected input is private data. Advises input processors that the text should **NOT** be stored or logged.
     * 
     * The user can also specify this through the "Improve inking and typing" setting (Settings->Privacy->Diagnostics & Feedback).
     * @type {Integer (Int32)}
     */
    static Private => 61

    /**
     * Input scope is intended for working with a map location.
     * @type {Integer (Int32)}
     */
    static Maps => 62

    /**
     * Expected input is a numeric password, or PIN.
     * @type {Integer (Int32)}
     */
    static NumericPassword => 63

    /**
     * Expected input is a numeric PIN.
     * @type {Integer (Int32)}
     */
    static NumericPin => 64

    /**
     * Expected input is an alphanumeric PIN.
     * @type {Integer (Int32)}
     */
    static AlphanumericPin => 65

    /**
     * Expected input is a mathematical formula. Advises input processors to show the number page.
     * @type {Integer (Int32)}
     */
    static FormulaNumber => 67

    /**
     * Expected input does not include emoji. Advises input processors to not show the emoji key.
     * @type {Integer (Int32)}
     */
    static ChatWithoutEmoji => 68
}
