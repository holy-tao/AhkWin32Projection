#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that indicate how a text-to-speech engine should interpret specific data.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-sayasinterpretas
 * @namespace Windows.Win32.UI.Accessibility
 */
class SayAsInterpretAs extends Win32Enum {

    /**
     * The text should be spoken using the default for the text-to-speech engine.
     * Native name: SayAsInterpretAs_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The text should be spoken character by character.
     * Native name: SayAsInterpretAs_Spell
     * @type {Integer (Int32)}
     */
    static Spell => 1

    /**
     * The text is an integral or decimal number and should be spoken as a cardinal number.
     * Native name: SayAsInterpretAs_Cardinal
     * @type {Integer (Int32)}
     */
    static Cardinal => 2

    /**
     * The text is an integral number and should be spoken as an ordinal number.
     * Native name: SayAsInterpretAs_Ordinal
     * @type {Integer (Int32)}
     */
    static Ordinal => 3

    /**
     * The text should be spoken as a number.
     * Native name: SayAsInterpretAs_Number
     * @type {Integer (Int32)}
     */
    static Number => 4

    /**
     * The text should be spoken as a date.
     * Native name: SayAsInterpretAs_Date
     * @type {Integer (Int32)}
     */
    static Date => 5

    /**
     * The text should be spoken as a time value.
     * Native name: SayAsInterpretAs_Time
     * @type {Integer (Int32)}
     */
    static Time => 6

    /**
     * The text should be spoken as a telephone number.
     * Native name: SayAsInterpretAs_Telephone
     * @type {Integer (Int32)}
     */
    static Telephone => 7

    /**
     * The text should be spoken as currency.
     * Native name: SayAsInterpretAs_Currency
     * @type {Integer (Int32)}
     */
    static Currency => 8

    /**
     * The text should be spoken as a network address, including saying the '\', '/', and '@' characters.
     * Native name: SayAsInterpretAs_Net
     * @type {Integer (Int32)}
     */
    static Net => 9

    /**
     * The text should be spoken as a URL.
     * Native name: SayAsInterpretAs_Url
     * @type {Integer (Int32)}
     */
    static Url => 10

    /**
     * The text should be spoken as an address.
     * Native name: SayAsInterpretAs_Address
     * @type {Integer (Int32)}
     */
    static Address => 11

    /**
     * The text should be spoken as an alphanumeric number.
     * Native name: SayAsInterpretAs_Alphanumeric
     * @type {Integer (Int32)}
     */
    static Alphanumeric => 12

    /**
     * The text should be spoken as a name.
     * Native name: SayAsInterpretAs_Name
     * @type {Integer (Int32)}
     */
    static Name => 13

    /**
     * The text should be spoken as media.
     * Native name: SayAsInterpretAs_Media
     * @type {Integer (Int32)}
     */
    static Media => 14

    /**
     * The text should be spoken as a date in a Month/Day/Year format.
     * Native name: SayAsInterpretAs_Date_MonthDayYear
     * @type {Integer (Int32)}
     */
    static Date_MonthDayYear => 15

    /**
     * The text should be spoken as a date in a Day/Month/Year format.
     * Native name: SayAsInterpretAs_Date_DayMonthYear
     * @type {Integer (Int32)}
     */
    static Date_DayMonthYear => 16

    /**
     * The text should be spoken as a date in a Year/Month/Day format.
     * Native name: SayAsInterpretAs_Date_YearMonthDay
     * @type {Integer (Int32)}
     */
    static Date_YearMonthDay => 17

    /**
     * The text should be spoken as a date in a Year/Month format.
     * Native name: SayAsInterpretAs_Date_YearMonth
     * @type {Integer (Int32)}
     */
    static Date_YearMonth => 18

    /**
     * The text should be spoken as a date in a Month/Year format.
     * Native name: SayAsInterpretAs_Date_MonthYear
     * @type {Integer (Int32)}
     */
    static Date_MonthYear => 19

    /**
     * The text should be spoken as a date in a Day/Month format.
     * Native name: SayAsInterpretAs_Date_DayMonth
     * @type {Integer (Int32)}
     */
    static Date_DayMonth => 20

    /**
     * The text should be spoken as a date in a Month/Day format.
     * Native name: SayAsInterpretAs_Date_MonthDay
     * @type {Integer (Int32)}
     */
    static Date_MonthDay => 21

    /**
     * The text should be spoken as a date in a Year format.
     * Native name: SayAsInterpretAs_Date_Year
     * @type {Integer (Int32)}
     */
    static Date_Year => 22

    /**
     * The text should be spoken as a time value in an Hours:Minutes:Seconds 12-hour format.
     * Native name: SayAsInterpretAs_Time_HoursMinutesSeconds12
     * @type {Integer (Int32)}
     */
    static Time_HoursMinutesSeconds12 => 23

    /**
     * The text should be spoken as a time value in an Hours:Minutes 12-hour format.
     * Native name: SayAsInterpretAs_Time_HoursMinutes12
     * @type {Integer (Int32)}
     */
    static Time_HoursMinutes12 => 24

    /**
     * The text should be spoken as a time value in an Hours:Minutes:Seconds 24-hour format.
     * Native name: SayAsInterpretAs_Time_HoursMinutesSeconds24
     * @type {Integer (Int32)}
     */
    static Time_HoursMinutesSeconds24 => 25

    /**
     * The text should be spoken as a time value in an Hours:Minutes 24-hour format.
     * Native name: SayAsInterpretAs_Time_HoursMinutes24
     * @type {Integer (Int32)}
     */
    static Time_HoursMinutes24 => 26
}
