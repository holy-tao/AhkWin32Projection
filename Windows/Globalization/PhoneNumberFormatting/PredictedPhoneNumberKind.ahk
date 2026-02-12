#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The kinds of phone numbers returned by [PhoneNumberInfo.PredictNumberKind](phonenumberinfo_predictnumberkind_261207465.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.predictedphonenumberkind
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class PredictedPhoneNumberKind extends Win32Enum{

    /**
     * A fixed telephone line.
     * @type {Integer (Int32)}
     */
    static FixedLine => 0

    /**
     * A mobile line.
     * @type {Integer (Int32)}
     */
    static Mobile => 1

    /**
     * Either a fixed line or a mobile line.
     * @type {Integer (Int32)}
     */
    static FixedLineOrMobile => 2

    /**
     * A toll-free number.
     * @type {Integer (Int32)}
     */
    static TollFree => 3

    /**
     * A number that charges a premium rate to connect.
     * @type {Integer (Int32)}
     */
    static PremiumRate => 4

    /**
     * A shared-cost service (caller pays part of the cost, recipient pays the rest.)
     * @type {Integer (Int32)}
     */
    static SharedCost => 5

    /**
     * A VOIP (Voice over IP) line.
     * @type {Integer (Int32)}
     */
    static Voip => 6

    /**
     * A number that reaches a private individual.
     * @type {Integer (Int32)}
     */
    static PersonalNumber => 7

    /**
     * A number that reaches a pager.
     * @type {Integer (Int32)}
     */
    static Pager => 8

    /**
     * A category that includes national services and corporate, institutional, or private network access numbers.
     * @type {Integer (Int32)}
     */
    static UniversalAccountNumber => 9

    /**
     * A number that reaches a voicemail service.
     * @type {Integer (Int32)}
     */
    static Voicemail => 10

    /**
     * A number that is none of the other kinds in this enumeration, or whose precise kind is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 11
}
