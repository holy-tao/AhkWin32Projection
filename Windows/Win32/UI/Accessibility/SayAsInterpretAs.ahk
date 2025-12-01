#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that indicate how a text-to-speech engine should interpret specific data.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-sayasinterpretas
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class SayAsInterpretAs extends Win32Enum{

    /**
     * The text should be spoken using the default for the text-to-speech engine.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_None => 0

    /**
     * The text should be spoken character by character.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Spell => 1

    /**
     * The text is an integral or decimal number and should be spoken as a cardinal number.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Cardinal => 2

    /**
     * The text is an integral number and should be spoken as an ordinal number.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Ordinal => 3

    /**
     * The text should be spoken as a number.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Number => 4

    /**
     * The text should be spoken as a date.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date => 5

    /**
     * The text should be spoken as a time value.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Time => 6

    /**
     * The text should be spoken as a telephone number.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Telephone => 7

    /**
     * The text should be spoken as currency.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Currency => 8

    /**
     * The text should be spoken as a network address, including saying the '\', '/', and '@' characters.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Net => 9

    /**
     * The text should be spoken as a URL.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Url => 10

    /**
     * The text should be spoken as an address.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Address => 11

    /**
     * The text should be spoken as an alphanumeric number.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Alphanumeric => 12

    /**
     * The text should be spoken as a name.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Name => 13

    /**
     * The text should be spoken as media.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Media => 14

    /**
     * The text should be spoken as a date in a Month/Day/Year format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date_MonthDayYear => 15

    /**
     * The text should be spoken as a date in a Day/Month/Year format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date_DayMonthYear => 16

    /**
     * The text should be spoken as a date in a Year/Month/Day format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date_YearMonthDay => 17

    /**
     * The text should be spoken as a date in a Year/Month format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date_YearMonth => 18

    /**
     * The text should be spoken as a date in a Month/Year format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date_MonthYear => 19

    /**
     * The text should be spoken as a date in a Day/Month format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date_DayMonth => 20

    /**
     * The text should be spoken as a date in a Month/Day format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date_MonthDay => 21

    /**
     * The text should be spoken as a date in a Year format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Date_Year => 22

    /**
     * The text should be spoken as a time value in an Hours:Minutes:Seconds 12-hour format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Time_HoursMinutesSeconds12 => 23

    /**
     * The text should be spoken as a time value in an Hours:Minutes 12-hour format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Time_HoursMinutes12 => 24

    /**
     * The text should be spoken as a time value in an Hours:Minutes:Seconds 24-hour format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Time_HoursMinutesSeconds24 => 25

    /**
     * The text should be spoken as a time value in an Hours:Minutes 24-hour format.
     * @type {Integer (Int32)}
     */
    static SayAsInterpretAs_Time_HoursMinutes24 => 26
}
