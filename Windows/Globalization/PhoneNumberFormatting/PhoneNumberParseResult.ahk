#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the results of trying to parse a string into a phone number.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.phonenumberformatting.phonenumberparseresult
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class PhoneNumberParseResult extends Win32Enum{

    /**
     * The prospective number has been parsed, and is valid.
     * @type {Integer (Int32)}
     */
    static Valid => 0

    /**
     * The prospective number is not valid.
     * @type {Integer (Int32)}
     */
    static NotANumber => 1

    /**
     * The prospective number has an invalid country code, and is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidCountryCode => 2

    /**
     * The prospective number is too short, and is not valid.
     * @type {Integer (Int32)}
     */
    static TooShort => 3

    /**
     * The prospective number is too long, and is not valid.
     * @type {Integer (Int32)}
     */
    static TooLong => 4
}
